# MacBook Pro Setup Guide — Professional/Developer Use

---

## 1. Account Setup

**During first boot:**

- Create your primary account as an **Admin** account
- Use a strong, unique local password (not your Apple ID password)
- Do **not** skip setting a password

**After first boot — lock root:**

```bash
sudo dscl . -create /Users/root UserShell /usr/bin/false
sudo dscl . -create /Users/root Password '*'
```

**Verify sudo works:**

```bash
sudo -l
groups $(whoami)  # should include 'admin'
```

---

## 2. System Security

**FileVault (full-disk encryption):**

```
System Settings → Privacy & Security → FileVault → Turn On
```

- Store recovery key locally (not iCloud) if this is a work machine
- Without this, your data is readable from any bootable USB

**Firewall:**

```
System Settings → Network → Firewall → Enable
```

- ~~Enable "Block all incoming connections" except services you explicitly need~~ - no need when connected to home network. Only use this when traveling or connected to an untrusted network


**Gatekeeper — keep default (on):**

- Don't disable it. Use `xattr -d com.apple.quarantine /path/to/app` for trusted one-off exceptions

**Screen lock:**

```
System Settings → Lock Screen
→ Require password: immediately
→ Screen saver: 5 min or less
```

**Disable unnecessary sharing services:**

```
System Settings → General → Sharing
→ Turn off everything you don't use (AirDrop, Remote Login, etc.)
```

---

## 3. Software Updates

```
System Settings → General → Software Update
→ Enable: Automatic security updates
→ Disable: Automatic macOS major version upgrades (update deliberately) - this is not done automatically be Apple, anyway
```

---

## 4. Developer Tooling

**Xcode CLI tools (required for most dev tools):**

```bash
xcode-select --install
```

**Homebrew:**

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Follow the post-install instructions to add it to your `PATH` (Apple Silicon path: `/opt/homebrew`)

**Git identity:**

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global core.pager delta   # requires delta (see below)
```

---

## 5. Shell: Zsh + Antidote + Starship

**Why not Oh My Zsh:** OMZ adds ~50–80ms to every shell startup, loads hundreds of aliases and functions you likely don't use, and has no static compilation. It's a convenience framework that has been superseded by faster, more composable tooling.

**Recommended stack:**

|Component|Tool|Replaces|
|---|---|---|
|Plugin manager|Antidote|Oh My Zsh|
|Prompt|Starship|Spaceship / p10k|
|Directory jump|zoxide|z / autojump|
|Fuzzy finder|fzf|—|

**Install:**

```bash
brew install antidote starship zoxide fzf
```

**Configure — two files:**

`~/.zsh_plugins.txt` controls what Antidote loads (see separate file). `~/.zshrc` sources Antidote, initialises tools, and manages your environment (see separate file).

**First run after editing `~/.zsh_plugins.txt`:**

```bash
antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh
```

---

## 6. SSH Setup

```bash
# Generate a key (Ed25519 is preferred)
ssh-keygen -t ed25519 -C "your@email.com" -f ~/.ssh/id_ed25519

# Add to agent
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

**`~/.ssh/config`:**

```
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
```

**Permissions:**

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
```

---

## 7. Python Environment Management

**The modern approach — two tools for two different needs:**

|Tool|Use case|Replaces|
|---|---|---|
|`uv`|Pure Python projects, scripts, CLI tools, version management|pyenv + pip + venv + pipx|
|`miniforge` (conda)|ML workloads requiring non-Python binaries (MKL, HDF5)|miniconda / anaconda|

✅ **uv** (primary — use this for everything first):

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

```bash
# Create and activate a project environment
uv init my-project
cd my-project
uv add numpy pandas

# Install a specific Python version
uv python install 3.12

# Run a script in isolation
uv run script.py
```

✅ **miniforge** (ML/GPU workloads only — install only if needed):

```bash
brew install --cask miniforge
conda config --set auto_activate false  # don't pollute default shell
```

**Do not run pyenv and conda simultaneously** — they both manipulate `PATH` and Python shims, creating conflicts. `uv` sidesteps this entirely.

---

## 8. Node.js: fnm

`fnm` (Fast Node Manager) is a drop-in replacement for `nvm`, written in Rust. It's ~30x faster on shell startup.

```bash
brew install fnm
```

Add to `~/.zshrc`:

```bash
eval "$(fnm env --use-on-cd --shell zsh)"
```

```bash
fnm install --lts
fnm use --lts
```

---

## 9. Core CLI Tooling

```bash
# Version control
brew install git gh git-delta lazygit

# Search & navigation
brew install ripgrep fd fzf zoxide bat eza

# System inspection
brew install htop bottom dust duf

# Data & text
brew install jq yq curl wget

# Dev utilities
brew install tmux tree gnupg

# Container & orchestration
brew install --cask orbstack        # Docker Desktop replacement — lighter, faster on Apple Silicon
brew install kubectl helm

# Editors
brew install neovim
brew install --cask cursor          # AI-native editor (VS Code fork)
brew install --cask zed             # Fast Rust-native editor with native AI support
```

**`eza` replaces `ls`** — add to `~/.aliases`:

```bash
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias lt='eza --tree --icons'
```

**`delta` enhances git diffs:**

```bash
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
```

---

## 10. AI & ML Engineering Tooling

### Local LLMs

```bash
brew install ollama              # CLI-first local LLM runner (see Caveats)
brew install --cask lm-studio   # GUI for local model management
```

```bash
# Pull and run a model
ollama pull llama3.2
ollama run llama3.2
```

### Python ML stack (via uv or conda)

```bash
# Via uv (Apple Silicon — CPU/MPS inference)
uv add torch torchvision torchaudio  # installs MPS-compatible build
uv add transformers datasets accelerate
uv add langchain langgraph
uv add openai anthropic

# Via conda (if you need MKL or cuDNN for Linux/CUDA targets)
conda install pytorch torchvision -c pytorch
```

### AI coding tools

```bash
brew install --cask cursor          # Cursor IDE — inline AI, multi-file context
brew install --cask claude          # Claude desktop app
```

Install the Claude Code CLI:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

### MLOps & experiment tracking

Ideally, per project and managed via `uv`. Can be installed as standalone CLI tools via the following:

```bash
uv tool install mlflow                  # experiment tracking
uv tool install wandb                   # Weights & Biases
uv tool install dvc                     # data version control
```

---

## 11. Developer Productivity

```bash
brew install --cask raycast         # Spotlight replacement — app launcher, clipboard, scripts
brew install --cask orbstack        # Docker/container management (lighter than Docker Desktop)
brew install --cask tableplus       # Database GUI
brew install --cask ghostty         # Fast GPU-accelerated terminal (alternative to iTerm2)
```

**Raycast:** replaces Spotlight (`⌘ Space`). Offers clipboard history, window management, script commands, and 1,300+ extensions.

---

## 12. Secrets & Credentials

- Use a **password manager** (1Password, Bitwarden) — not iCloud Keychain for work credentials
- Never store secrets in dotfiles or shell history
- Use `HISTIGNORE` or a leading space to suppress sensitive commands:

```bash
# In ~/.zshrc
setopt HIST_IGNORE_SPACE   # commands prefixed with a space are not saved
```

- For project secrets: use `.env` files (git-ignored) + `direnv` or `uv`'s env loading

---

## 13. Dotfiles

Track your config in a git repo:

```
~/.zshrc
~/.zsh_plugins.txt
~/.gitconfig
~/.ssh/config       # no private keys — config only
~/.config/starship.toml
~/.aliases
```

This lets you rebuild a new machine in minutes.

---

## 14. Hardening Checklist

|Area|Action|Priority|
|---|---|---|
|Disk encryption|FileVault on|Critical|
|Firewall|Enabled|Critical|
|Root account|Locked|High|
|Screen lock|Immediate on sleep|High|
|Software updates|Auto security patches|High|
|Sharing services|All off by default|Medium|
|SSH keys|Ed25519, agent-managed|Medium|
|Secrets|Password manager only|High|
|Dotfiles|Version controlled|Low|

---

## 15. What to Skip

- **SIP (System Integrity Protection):** Do not disable it. Almost no legitimate use case requires it.
- **Disabling Gatekeeper globally:** Unnecessary risk.
- **Root account enabled:** No reason to.
- **Third-party antivirus:** Low value on a well-configured macOS machine; adds attack surface.
- **Oh My Zsh:** Superseded by faster, more composable tooling.
- **nvm:** Replace with `fnm`.
- **pyenv + conda simultaneously:** Pick one or use `uv` as primary.
- **Docker Desktop:** OrbStack is faster and lighter on Apple Silicon.