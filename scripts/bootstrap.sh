#!/usr/bin/env bash
# bootstrap.sh — set up a new Mac from this dotfiles repo
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/neiljdo/dotfiles/main/scripts/bootstrap.sh | bash
#   — or, after cloning —
#   bash ~/dotfiles/scripts/bootstrap.sh
#
# What this does (all idempotent — safe to re-run):
#   1. Install Xcode CLI tools
#   2. Install Homebrew
#   3. Clone dotfiles repo to ~/dotfiles (skipped if already present)
#   4. Install all packages via Brewfile
#   5. Symlink dotfiles into $HOME
#   6. Generate antidote bundle
#   7. Set zsh as default shell
#
# What this does NOT do (manual steps required):
#   - FileVault, Firewall, Screen lock (System Settings)
#   - SSH key generation (ssh-keygen)
#   - Service auth: gh auth login, gcloud auth login, etc.
#   - fnm: fnm install --lts && fnm use --lts
#   - uv install: curl -LsSf https://astral.sh/uv/install.sh | sh

set -euo pipefail

DOTFILES_REPO="https://github.com/neiljdo/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"

# -----------------------------------------------------------------------------
info()    { printf '\033[34m==>\033[0m %s\n' "$*"; }
success() { printf '\033[32m  ✓\033[0m %s\n' "$*"; }
warning() { printf '\033[33m  !\033[0m %s\n' "$*"; }

symlink() {
  local src="$1" dst="$2"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    success "already linked: $dst"
    return
  fi
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    warning "backing up existing $dst → ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  success "linked: $dst → $src"
}

# -----------------------------------------------------------------------------
# 1. Xcode CLI tools
# -----------------------------------------------------------------------------
info "Checking Xcode CLI tools..."
if ! xcode-select -p &>/dev/null; then
  info "Installing Xcode CLI tools (follow the prompt)..."
  xcode-select --install
  read -rp "Press Enter once the installation completes..."
else
  success "Xcode CLI tools already installed"
fi

# -----------------------------------------------------------------------------
# 2. Homebrew
# -----------------------------------------------------------------------------
info "Checking Homebrew..."
if ! command -v brew &>/dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Apple Silicon path
  eval "$(/opt/homebrew/bin/brew shellenv)" 2>/dev/null || eval "$(/usr/local/bin/brew shellenv)"
else
  success "Homebrew already installed"
fi

# -----------------------------------------------------------------------------
# 3. Clone dotfiles
# -----------------------------------------------------------------------------
info "Checking dotfiles repo..."
if [ ! -d "$DOTFILES_DIR/.git" ]; then
  info "Cloning dotfiles to $DOTFILES_DIR..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
else
  success "Dotfiles repo already at $DOTFILES_DIR"
fi

# -----------------------------------------------------------------------------
# 4. Homebrew packages
# -----------------------------------------------------------------------------
info "Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/Brewfile"
success "Brewfile done"

# -----------------------------------------------------------------------------
# 5. Symlinks
# -----------------------------------------------------------------------------
info "Symlinking dotfiles..."

# Shell
symlink "$DOTFILES_DIR/.zshrc"           "$HOME/.zshrc"
symlink "$DOTFILES_DIR/.aliases"          "$HOME/.aliases"
symlink "$DOTFILES_DIR/.zsh_plugins.txt"  "$HOME/.zsh_plugins.txt"

# Git
symlink "$DOTFILES_DIR/.gitconfig"        "$HOME/.gitconfig"

# tmux
symlink "$DOTFILES_DIR/.tmux.conf"        "$HOME/.tmux.conf"

# Finicky
symlink "$DOTFILES_DIR/.finicky.js"       "$HOME/.finicky.js"

# SSH (config only — no private keys)
symlink "$DOTFILES_DIR/.ssh/config"       "$HOME/.ssh/config"

# .config
symlink "$DOTFILES_DIR/.config/starship.toml"    "$HOME/.config/starship.toml"
symlink "$DOTFILES_DIR/.config/ghostty/config"   "$HOME/.config/ghostty/config"
symlink "$DOTFILES_DIR/.config/cmux/cmux.json"   "$HOME/.config/cmux/cmux.json"
symlink "$DOTFILES_DIR/.config/karabiner/karabiner.json"          "$HOME/.config/karabiner/karabiner.json"
symlink "$DOTFILES_DIR/.config/karabiner/karabiner-elements.json" "$HOME/.config/karabiner/karabiner-elements.json"

# Claude Code
symlink "$DOTFILES_DIR/.claude/settings.user.json"    "$HOME/.claude/settings.json"
symlink "$DOTFILES_DIR/.claude/statusline-command.sh" "$HOME/.claude/statusline-command.sh"

# -----------------------------------------------------------------------------
# 6. Antidote bundle
# -----------------------------------------------------------------------------
info "Generating antidote bundle..."
if command -v antidote &>/dev/null; then
  antidote bundle < "$HOME/.zsh_plugins.txt" > "$HOME/.zsh_plugins.zsh"
  success "Antidote bundle generated"
else
  warning "antidote not found — run manually after shell restart: antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh"
fi

# -----------------------------------------------------------------------------
# 7. Default shell
# -----------------------------------------------------------------------------
info "Checking default shell..."
ZSH_PATH="$(command -v zsh)"
if [ "$SHELL" != "$ZSH_PATH" ]; then
  if ! grep -qF "$ZSH_PATH" /etc/shells; then
    info "Adding $ZSH_PATH to /etc/shells..."
    echo "$ZSH_PATH" | sudo tee -a /etc/shells
  fi
  chsh -s "$ZSH_PATH"
  success "Default shell set to $ZSH_PATH"
else
  success "Default shell already zsh"
fi

# -----------------------------------------------------------------------------
printf '\n\033[32mBootstrap complete.\033[0m\n\n'
printf 'Manual steps remaining:\n'
printf '  • FileVault, Firewall, Screen lock — System Settings\n'
printf '  • SSH key: ssh-keygen -t ed25519 -C "your@email.com"\n'
printf '  • GitHub CLI: gh auth login\n'
printf '  • Node: fnm install --lts && fnm use --lts\n'
printf '  • Python: curl -LsSf https://astral.sh/uv/install.sh | sh\n'
printf '  • Reload shell: exec zsh\n\n'
