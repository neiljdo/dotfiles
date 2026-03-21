# =============================================================================
# ~/.zshrc
# Plugin manager : Antidote (brew install antidote)
# Prompt         : Starship  (brew install starship)
# Dirs           : zoxide    (brew install zoxide)   — replaces z
# Node           : fnm       (brew install fnm)      — replaces nvm
# Python         : uv (primary) + miniforge (ML only)
# =============================================================================

# -----------------------------------------------------------------------------
# Completion — initialise once per day, use cache otherwise
# -----------------------------------------------------------------------------
autoload -Uz compinit
if [[ -n "${ZDOTDIR:-$HOME}/.zcompdump"(N.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# -----------------------------------------------------------------------------
# Antidote — plugin manager
# Regenerate static file when .zsh_plugins.txt changes:
#   antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh
# -----------------------------------------------------------------------------
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

# -----------------------------------------------------------------------------
# Prompt — Starship
# Config: ~/.config/starship.toml
# Docs  : https://starship.rs/config/
# -----------------------------------------------------------------------------
eval "$(starship init zsh)"

# -----------------------------------------------------------------------------
# History
# -----------------------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=999999
SAVEHIST=999999
setopt HIST_IGNORE_DUPS       # no duplicate adjacent entries
setopt HIST_IGNORE_SPACE      # commands prefixed with a space are not saved (use for secrets)
setopt HIST_REDUCE_BLANKS
unsetopt SHARE_HISTORY        # share history across sessions, but avoid interleaving of history when multiple terminals are active
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY       # timestamp each entry

# -----------------------------------------------------------------------------
# Shell behaviour
# -----------------------------------------------------------------------------
setopt AUTO_CD                # type a directory name to cd into it
setopt CORRECT                # suggest corrections for mistyped commands
setopt NO_BEEP

# -----------------------------------------------------------------------------
# PATH — Homebrew (Apple Silicon)
# -----------------------------------------------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# -----------------------------------------------------------------------------
# Alacritty completions
# -----------------------------------------------------------------------------
fpath+="${ZDOTDIR:-$HOME}/.zsh_functions"

# -----------------------------------------------------------------------------
# fzf
# -----------------------------------------------------------------------------
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# -----------------------------------------------------------------------------
# zoxide — replaces z
# Use: z <partial-dir>, zi for interactive selection
# -----------------------------------------------------------------------------
eval "$(zoxide init zsh)"

# -----------------------------------------------------------------------------
# Python: uv (primary)
# Manages Python versions and virtual environments.
# Replaces pyenv + pip + venv for pure-Python workloads.
# Install: curl -LsSf https://astral.sh/uv/install.sh | sh
# -----------------------------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------------------------------------------------------
# Python: Miniforge / Conda
# Use ONLY for ML workloads requiring non-Python binaries (MKL, HDF5, etc.).
# Keep auto_activate_base off — activate explicitly with `conda activate <env>`.
# -----------------------------------------------------------------------------
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
elif [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
    . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
else
    export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
fi
unset __conda_setup
conda config --set auto_activate_base false 2>/dev/null

# -----------------------------------------------------------------------------
# Node.js: fnm — replaces nvm (~30x faster startup)
# Install: brew install fnm
# Usage  : fnm install --lts && fnm use --lts
# -----------------------------------------------------------------------------
eval "$(fnm env --use-on-cd --shell zsh)"

# -----------------------------------------------------------------------------
# Ruby: RVM
# -----------------------------------------------------------------------------
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# -----------------------------------------------------------------------------
# Haskell: GHCup
# -----------------------------------------------------------------------------
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] \
  && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# -----------------------------------------------------------------------------
# Neovim
# -----------------------------------------------------------------------------
export VISUAL=nvim
export EDITOR=nvim
export VIMCONFIG="$HOME/.config/nvim"
export VIMDATA="$HOME/.local/share/nvim"

# -----------------------------------------------------------------------------
# bat — better cat
# -----------------------------------------------------------------------------
export BAT_THEME="gruvbox-dark"

# -----------------------------------------------------------------------------
# Julia
# -----------------------------------------------------------------------------
export JULIA_NUM_THREADS=6

# -----------------------------------------------------------------------------
# Homebrew-managed overrides
# -----------------------------------------------------------------------------
export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"
export PATH="/opt/homebrew/opt/tcl-tk@8/bin:$PATH"

# mecab — use brew --prefix to avoid version-pinned path
# Uncomment if needed:
# export PATH="$PATH:$(brew --prefix mecab)/libexec/mecab"

# -----------------------------------------------------------------------------
# LM Studio CLI
# -----------------------------------------------------------------------------
export PATH="$PATH:$HOME/.lmstudio/bin"

# -----------------------------------------------------------------------------
# Google Cloud SDK — uncomment when needed
# -----------------------------------------------------------------------------
[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]       && source "$HOME/google-cloud-sdk/path.zsh.inc"
[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]  && source "$HOME/google-cloud-sdk/completion.zsh.inc"

# -----------------------------------------------------------------------------
# tmux: set terminal to support 256 colours outside of a tmux session
# -----------------------------------------------------------------------------
[ -z "$TMUX" ] && export TERM="xterm-256color"

# -----------------------------------------------------------------------------
# Aliases — sourced from a separate file to keep this file clean
# -----------------------------------------------------------------------------
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# =============================================================================
# Notes:
# - Never write secrets here. Use a password manager + .env files per project.
# - Prefix any command with a space to prevent it from being saved to history.
# - To benchmark shell startup: for i in $(seq 10); do /usr/bin/time zsh -lic exit; done
# =============================================================================
