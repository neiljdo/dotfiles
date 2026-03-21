# GCP Ops Setup Guide — Local Development & Engineering

> Companion to `macbook-setup-guide.md`. Covers CLI installation, authentication,
> multi-project configuration, and common workflow commands for software and ML engineering on GCP.

---

## 1. Installation

Use the **native installer** — not Homebrew. gcloud manages its own component ecosystem
(`kubectl`, `bq`, `gsutil`, etc.) internally, and Homebrew disables `gcloud components update`,
forcing all updates through Homebrew instead.

```bash
curl https://sdk.cloud.google.com | bash
exec -l $SHELL   # restart shell to pick up PATH changes
```

Verify:
```bash
gcloud version
```

**Shell integration** — add to `~/.zshrc` (with double quotes to allow `$HOME` expansion):
```bash
[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]       && source "$HOME/google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]  && source "$HOME/google-cloud-sdk/completion.zsh.inc"
```

**Install components:**
```bash
gcloud components install kubectl
gcloud components install bq
gcloud components install gsutil
gcloud components update   # keep all components current
```

---

## 2. Authentication

gcloud has two distinct credential layers. Both are required for a complete local setup.

### 2.1 CLI credentials (`gcloud auth login`)

Used by `gcloud` commands themselves to manage GCP resources.

```bash
gcloud auth login
```

Opens a browser OAuth flow. Credentials stored in `~/.config/gcloud/`.

### 2.2 Application Default Credentials — ADC (`gcloud auth application-default login`)

Used by SDKs, client libraries, and tools like Terraform and LangChain to authenticate
programmatically. Distinct from CLI credentials — both must be configured.

```bash
gcloud auth application-default login
```

Set the quota project to avoid billing/quota warnings:
```bash
gcloud auth application-default set-quota-project YOUR_PROJECT_ID
```

ADC credentials are stored at:
```
~/.config/gcloud/application_default_credentials.json
```

**Critical:** `gcloud auth login` alone is not sufficient for SDK-based tools. If your Python,
Go, or Terraform code is failing auth, you likely need to run `application-default login`.

### 2.3 Verify auth state

```bash
gcloud auth list                        # all authenticated accounts
gcloud auth application-default print-access-token   # confirm ADC is working
gcloud config get-value project         # confirm active project
```

---

## 3. Multi-Project Configuration

### 3.1 Named configurations

gcloud supports named configurations — equivalent to AWS profiles. Each configuration
stores an account, project, region, and zone.

```bash
# Create configurations per environment
gcloud config configurations create dev
gcloud config set account you@example.com
gcloud config set project my-dev-project
gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a

gcloud config configurations create staging
gcloud config set account you@example.com
gcloud config set project my-staging-project
gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a

gcloud config configurations create prod
gcloud config set account you@example.com
gcloud config set project my-prod-project
gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a
```

Switch between configurations:
```bash
gcloud config configurations activate dev
gcloud config configurations list          # see all, current marked IS_ACTIVE=True
```

Run a one-off command in a different configuration without switching:
```bash
gcloud compute instances list --configuration=prod
```

### 3.2 Auto-switching with direnv

`direnv` automatically sets the active gcloud configuration when you `cd` into a project
directory, preventing accidental operations on the wrong project.

```bash
brew install direnv
```

Add to `~/.zshrc`:
```bash
eval "$(direnv hook zsh)"
```

In each project directory, create a `.envrc` file:
```bash
# ~/projects/my-gcp-project/.envrc
export CLOUDSDK_ACTIVE_CONFIG_NAME=dev
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/dev-adc.json"
```

Allow direnv to load it:
```bash
direnv allow .
```

Add `.envrc` to your global `.gitignore` — or commit it if it contains no secrets.

### 3.3 Managing multiple ADC credential files

By default, `application-default login` overwrites a single file. For multiple accounts,
save each credential set under a distinct name:

```bash
# Authenticate each account and save separately
gcloud auth application-default login
mv ~/.config/gcloud/application_default_credentials.json \
   ~/.config/gcloud/dev-adc.json

gcloud auth application-default login   # authenticate second account
mv ~/.config/gcloud/application_default_credentials.json \
   ~/.config/gcloud/prod-adc.json
```

Then reference the correct file in each project's `.envrc`:
```bash
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/prod-adc.json"
```

---

## 4. Security — Credentials Hygiene

Service account keys are high-risk if mismanaged. Prefer alternatives where possible.

| Method | Use case | Risk |
|---|---|---|
| `gcloud auth application-default login` | Local dev | Low — scoped to your account |
| Workload Identity Federation | CI/CD, GKE | Low — no long-lived key |
| Service account key (JSON) | Legacy or cross-cloud | High — treat as a secret |
| Service account impersonation | Privilege escalation testing | Medium |

**If you must use a service account key:**
- Store in a secrets manager (not in `.env` files or version control)
- Restrict the key's IAM roles to minimum required
- Rotate regularly
- Never commit to git — add `*.json` patterns to `.gitignore` for credential directories

**Impersonate a service account without a key:**
```bash
gcloud projects list \
  --impersonate-service-account=sa-name@project.iam.gserviceaccount.com
```

---

## 5. Core Workflow Commands

### Projects & configuration
```bash
gcloud projects list
gcloud config set project PROJECT_ID
gcloud config get-value project
gcloud info                            # full environment summary
```

### IAM
```bash
gcloud projects get-iam-policy PROJECT_ID
gcloud projects add-iam-policy-binding PROJECT_ID \
  --member="user:you@example.com" \
  --role="roles/viewer"
gcloud iam roles list --project=PROJECT_ID
gcloud iam service-accounts list
```

### Compute
```bash
gcloud compute instances list
gcloud compute instances start INSTANCE_NAME --zone=ZONE
gcloud compute instances stop INSTANCE_NAME --zone=ZONE
gcloud compute ssh INSTANCE_NAME --zone=ZONE
```

### Cloud Storage
```bash
gcloud storage buckets list
gcloud storage buckets create gs://my-bucket --location=us-central1
gcloud storage cp local-file.txt gs://my-bucket/
gcloud storage ls gs://my-bucket/
gcloud storage rm gs://my-bucket/file.txt
```

### Artifact Registry (container images)
```bash
# Authenticate Docker to Artifact Registry
gcloud auth configure-docker us-central1-docker.pkg.dev

# Push an image
docker tag my-image us-central1-docker.pkg.dev/PROJECT/REPO/my-image:latest
docker push us-central1-docker.pkg.dev/PROJECT/REPO/my-image:latest
```

### Cloud Run
```bash
gcloud run deploy SERVICE_NAME \
  --image=us-central1-docker.pkg.dev/PROJECT/REPO/my-image:latest \
  --region=us-central1 \
  --platform=managed

gcloud run services list --region=us-central1
gcloud run services describe SERVICE_NAME --region=us-central1
gcloud run revisions list --service=SERVICE_NAME --region=us-central1
```

### GKE
```bash
# Get credentials for a cluster
gcloud container clusters get-credentials CLUSTER_NAME \
  --region=us-central1 \
  --project=PROJECT_ID

gcloud container clusters list
kubectl config get-contexts    # verify correct context is active
```

### BigQuery
```bash
bq ls                                           # list datasets
bq ls PROJECT_ID:DATASET                        # list tables
bq query --use_legacy_sql=false 'SELECT ...'
bq show PROJECT_ID:DATASET.TABLE
```

### Logging
```bash
gcloud logging read "severity>=ERROR" --limit=50
gcloud logging read "resource.type=cloud_run_revision" --limit=20
gcloud logging tail "severity>=WARNING"           # live stream
```

---

## 6. ML Engineering — Vertex AI

```bash
# Install Vertex AI SDK
uv add google-cloud-aiplatform

# List custom training jobs
gcloud ai custom-jobs list --region=us-central1

# Submit a training job
gcloud ai custom-jobs create \
  --region=us-central1 \
  --display-name=my-training-job \
  --config=job-config.yaml

# List model endpoints
gcloud ai endpoints list --region=us-central1

# List models in Model Registry
gcloud ai models list --region=us-central1
```

Python SDK authentication is handled automatically via ADC — no additional config needed
beyond `gcloud auth application-default login`.

---

## 7. Prompt Integration — Active Config Visibility

Add the active gcloud project to your Starship prompt to prevent operating in the wrong context.

In `~/.config/starship.toml`:
```toml
[gcloud]
format = 'on [$symbol$project]($style) '
symbol = "☁️ "
style = "bold blue"
```

Or as a shell function in `~/.aliases`:
```bash
alias gcp-context='echo "Project: $(gcloud config get-value project) | Config: $(gcloud config configurations list --filter=is_active=true --format="value(name)")"'
```

---

## 8. Useful Aliases

Add to `~/.aliases`:
```bash
# Configuration switching
alias gconf='gcloud config configurations activate'
alias gconfls='gcloud config configurations list'
alias gproj='gcloud config set project'

# Quick context check — run before any destructive operation
alias gcp-who='echo "Account: $(gcloud config get-value account)\nProject: $(gcloud config get-value project)\nConfig:  $(gcloud config configurations list --filter=is_active=true --format="value(name)")"'

# Logging shortcuts
alias glogs='gcloud logging read --limit=50'
alias glog-tail='gcloud logging tail'

# GKE context check
alias kctx='kubectl config current-context'
```

---

## 9. Files to Version Control

```
~/.config/gcloud/configurations/   # gcloud named configs (no secrets)
.envrc                              # per-project direnv config (no secrets)
~/.config/starship.toml            # includes gcloud prompt config
~/.aliases                         # gcloud aliases
```

**Never version control:**
```
~/.config/gcloud/application_default_credentials.json
~/.config/gcloud/*-adc.json
any *.json service account key files
```

---

## 10. Checklist — New Machine Setup

```
[ ] Install gcloud via native installer (not Homebrew)
[ ] gcloud auth login
[ ] gcloud auth application-default login
[ ] gcloud auth application-default set-quota-project PROJECT_ID
[ ] gcloud components install kubectl bq gsutil
[ ] Create named configurations per project/environment
[ ] Install direnv, configure .envrc per project
[ ] Add gcloud to Starship prompt
[ ] Add aliases to ~/.aliases
[ ] Confirm kubectl context after each cluster credentials fetch
```
