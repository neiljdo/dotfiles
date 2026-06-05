# MacBook Pro Setup Guide — Professional/Developer Use

---

## 1. Pre-Bootstrap (GUI — do first)

These steps require System Settings or run before you have a terminal. Complete them before running the bootstrap script.

### Account setup

**During first boot:**
- Create your primary account as an **Admin** account
- Use a strong, unique local password (not your Apple ID password)

**After first boot — lock root:**

```bash
sudo dscl . -create /Users/root UserShell /usr/bin/false
sudo dscl . -create /Users/root Password '*'
```

### Security

**FileVault (full-disk encryption):**
```
System Settings → Privacy & Security → FileVault → Turn On
```
Store recovery key locally (not iCloud) on a work machine. Without this, data is readable from any bootable USB.

**Firewall:**
```
System Settings → Network → Firewall → Enable
```

**Screen lock:**
```
System Settings → Lock Screen → Require password: immediately
```

**Disable unnecessary sharing services:**
```
System Settings → General → Sharing → turn off everything unused
```

**Gatekeeper — keep default (on).** For trusted one-off exceptions: `xattr -d com.apple.quarantine /path/to/app`

### Software updates

```
System Settings → General → Software Update
→ Enable: Automatic security updates
→ Leave: Automatic major version upgrades off (update deliberately)
```

---

## 2. Bootstrap

Installs Xcode CLI tools, Homebrew, all packages from `Brewfile`, symlinks all dotfiles, generates the antidote bundle, and sets zsh as the default shell.

```bash
# From a fresh machine (no clone yet)
bash <(curl -fsSL https://raw.githubusercontent.com/neiljdo/dotfiles/main/scripts/bootstrap.sh)

# From an existing clone
bash ~/dotfiles/scripts/bootstrap.sh
```

See `scripts/bootstrap.sh` for the full list of what runs. Safe to re-run — all steps are idempotent.

---

## 3. Post-Bootstrap (manual — in order)

Complete these after the bootstrap script finishes.

### 1. Git identity

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

### 2. SSH key

```bash
ssh-keygen -t ed25519 -C "your@email.com" -f ~/.ssh/id_ed25519
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
```

Then add `~/.ssh/id_ed25519.pub` to GitHub, servers, etc.

### 3. Service authentication

```bash
gh auth login                   # GitHub CLI
```

### 4. Node — fnm

```bash
fnm install --lts
fnm use --lts
```

### 5. Reload shell

```bash
exec zsh
```

---

## 4. What's Installed

All packages are declared in `Brewfile`. Key tools:

| Category | Tools |
|---|---|
| Shell | antidote, starship, zoxide, fzf, tmux |
| Modern CLI | bat, eza, ripgrep, fd, bottom, dust, duf |
| Git | git, git-delta, gh, lazygit |
| Data | jq, yq, curl, wget |
| Dev | direnv, fnm, uv, gnupg, neovim |
| Cloud | helm |
| AI/ML | ollama, lm-studio |
| Terminals | ghostty, cmux |
| Editors | cursor, zed |
| Browsers | brave-browser, firefox |
| Productivity | raycast, obsidian, orbstack, tableplus |

Update `Brewfile` from your current machine: `brew bundle dump --force`

Install from `Brewfile` directly: `brew bundle`

---

## 5. Key Tools

**cmux** — macOS terminal built on Ghostty with native workspace layouts, sidebar (branches, ports, PRs), and first-class Claude Code / Cursor integration. Config at `~/.config/cmux/cmux.json`.

**Raycast** — replaces Spotlight (`⌘ Space`). Clipboard history, window management, script commands.

**OrbStack** — Docker Desktop replacement. Lighter and faster on Apple Silicon.

**uv** — primary Python tool. Replaces pyenv + pip + venv + pipx.

**miniforge** — conda, for ML workloads that require non-Python binaries (MKL, HDF5). Install only if needed: `brew install --cask miniforge`. Do not run alongside uv's Python management simultaneously.

**fnm** — Node version manager, written in Rust. ~30x faster startup than nvm.

**delta** — git diff pager. Wired up in `.gitconfig` automatically.

---

## 6. Claude Code

```bash
# Install the CLI (not in Brewfile — installer manages its own updates)
curl -fsSL https://claude.ai/install.sh | bash
```

The bootstrap script symlinks `.claude/settings.user.json` → `~/.claude/settings.json` and `.claude/statusline-command.sh` → `~/.claude/statusline-command.sh`.

Per-project overrides go in `.claude/settings.json` inside the project repo — these take precedence over the user-level config.

**cmux configuration** is handled by the bootstrap symlink. To set it up manually:

```bash
ln -sf ~/dotfiles/.config/cmux/cmux.json ~/.config/cmux/cmux.json
```

For per-project layouts, copy the project template into a repo:

```bash
cp ~/dotfiles/.config/cmux/project-template.cmux.json <repo>/.cmux/cmux.json
```

---

## 7. Google Cloud (GCP)

See **[docs/gcp.md](docs/gcp.md)** for the full setup guide — installation, authentication (CLI + ADC), multi-project configuration, and workflow commands.

---

## 8. Secrets & Credentials

- Use a **password manager** (1Password, Bitwarden) — not iCloud Keychain for work credentials
- Never store secrets in dotfiles or shell history
- Prefix any command with a space to exclude it from history (`HIST_IGNORE_SPACE` is set in `.zshrc`)
- For project secrets: `.env` files (git-ignored) + `direnv` or `uv`'s env loading

---

## 9. Dotfiles Structure

Tracked files and their symlink targets:

```
~/dotfiles/.zshrc                        → ~/.zshrc
~/dotfiles/.aliases                      → ~/.aliases
~/dotfiles/.zsh_plugins.txt             → ~/.zsh_plugins.txt
~/dotfiles/.gitconfig                   → ~/.gitconfig
~/dotfiles/.tmux.conf                   → ~/.tmux.conf
~/dotfiles/.finicky.js                  → ~/.finicky.js
~/dotfiles/.ssh/config                  → ~/.ssh/config  (no private keys)
~/dotfiles/.config/starship.toml        → ~/.config/starship.toml
~/dotfiles/.config/ghostty/config       → ~/.config/ghostty/config
~/dotfiles/.config/cmux/cmux.json       → ~/.config/cmux/cmux.json
~/dotfiles/.config/karabiner/           → ~/.config/karabiner/
~/dotfiles/.claude/settings.user.json   → ~/.claude/settings.json
~/dotfiles/.claude/statusline-command.sh → ~/.claude/statusline-command.sh
```

---

## 10. Hardening Checklist

| Area | Action | Priority |
|---|---|---|
| Disk encryption | FileVault on | Critical |
| Firewall | Enabled | Critical |
| Root account | Locked | High |
| Screen lock | Immediate on sleep | High |
| Software updates | Auto security patches | High |
| Sharing services | All off by default | Medium |
| SSH keys | Ed25519, agent-managed | Medium |
| Secrets | Password manager only | High |
| Dotfiles | Version controlled | Low |

---

## 11. What to Skip

- **SIP (System Integrity Protection):** Do not disable it.
- **Disabling Gatekeeper globally:** Unnecessary risk.
- **Root account enabled:** No reason to.
- **Third-party antivirus:** Low value on a well-configured macOS machine; adds attack surface.
- **Oh My Zsh:** Superseded by antidote + selective plugin loading.
- **nvm:** Use `fnm`.
- **pyenv + conda simultaneously:** Use `uv` as primary; conda only for ML binaries.
- **Docker Desktop:** OrbStack is faster and lighter on Apple Silicon.
