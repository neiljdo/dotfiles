# Python Setup Guide

> Companion to `README.md`. Covers uv project workflow, per-project ML dependencies,
> miniforge for GPU/binary workloads, and direnv integration.

---

## 1. Tool Choice

| Tool | Use case | Replaces |
|---|---|---|
| `uv` | Pure Python projects, scripts, CLI tools, Python version management | pyenv + pip + venv + pipx |
| `miniforge` (conda) | ML workloads requiring non-Python binaries (MKL, HDF5, CUDA) | miniconda / anaconda |

**Default to `uv`.** Only reach for conda when a dependency requires compiled non-Python
binaries that aren't available as wheels (rare on Apple Silicon with modern PyPI).

Do not run pyenv and conda simultaneously — they both manipulate `PATH` and Python shims.
`uv` sidesteps this entirely.

---

## 2. uv — Project Workflow

### New project

```bash
uv init my-project
cd my-project
uv add numpy pandas        # adds to pyproject.toml, installs into .venv
uv run script.py           # runs in the project venv
```

### Python version

```bash
uv python install 3.12     # download and manage Python versions
uv python pin 3.12         # pin version for this project (.python-version)
```

### Sync dependencies (e.g. after cloning)

```bash
uv sync                    # installs all deps from uv.lock
uv sync --extra dev        # include optional dev dependencies
```

### Add dev/optional dependencies

```bash
uv add --dev pytest ruff mypy
uv add --optional ml torch transformers
```

### Run tools without installing

```bash
uvx ruff check .           # ephemeral run — no install needed
uvx mypy src/
```

---

## 3. Per-Project ML Dependencies

These are per-project `uv add` dependencies, not global installs.

### Cloud compute

```bash
uv add modal               # serverless GPU compute
```

### Experiment tracking

```bash
uv add mlflow              # self-hosted experiment tracking
uv add wandb               # Weights & Biases
```

### Data version control

```bash
uv add dvc                 # data and model versioning
uv add "dvc[s3]"           # with S3 remote support
uv add "dvc[gs]"           # with GCS remote support
```

### ML frameworks (Apple Silicon)

```bash
uv add torch torchvision torchaudio   # MPS-compatible build auto-selected
uv add transformers datasets accelerate
uv add langchain langgraph
uv add openai anthropic
```

### GCP / Vertex AI

```bash
uv add google-cloud-aiplatform
uv add google-cloud-storage
```

---

## 4. miniforge — When You Need It

Install only if a dependency requires non-Python binaries unavailable as wheels:

```bash
brew install --cask miniforge
conda config --set auto_activate_base false   # don't pollute default shell
```

Create an isolated environment (never use base):

```bash
conda create -n myenv python=3.11
conda activate myenv
conda install pytorch torchvision -c pytorch  # MKL / cuDNN builds
```

Deactivate when done — do not leave conda active in your default shell alongside uv.

---

## 5. direnv — Per-Project Environment Variables

`direnv` automatically loads and unloads env vars when you `cd` into a project directory.
Installed via Brewfile; the omz `direnv` plugin handles shell integration.

### Basic usage

Create `.envrc` in the project root:

```bash
# .envrc
export DATABASE_URL="postgresql://localhost/mydb"
export API_KEY="..."        # use secrets manager in production
export PYTHONPATH="src"
```

Allow it:

```bash
direnv allow .
```

### Python venv auto-activation

```bash
# .envrc
layout uv                  # auto-creates and activates .venv via uv
```

Or for an existing venv:

```bash
# .envrc
source .venv/bin/activate
```

### GCP project switching

```bash
# .envrc
export CLOUDSDK_ACTIVE_CONFIG_NAME=dev
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/dev-adc.json"
```

### Version control

Commit `.envrc` if it contains no secrets — it documents the project's env requirements.
Never commit `.env` files.

---

## 6. Checklist — New Project Setup

```
[ ] uv init <project-name>
[ ] uv python pin <version>
[ ] uv add <dependencies>
[ ] uv add --dev pytest ruff mypy
[ ] echo ".venv/" >> .gitignore
[ ] touch .envrc && direnv allow .
[ ] git init && git add pyproject.toml uv.lock .python-version .gitignore
```
