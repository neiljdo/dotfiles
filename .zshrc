# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(django git-flow-avh hadoop mercurial node npm nvm virtualenvwrapper)
plugins=(
  anaconda
  docker
  git
  colored-man-pages
  colorize
  github
  history
  jira
  vagrant
  virtualenv
  pip
  python
  brew
  osx
  sublime
  tmux
  virtualenv
  z
  python
  scala
  sbt
  vi-mode
  minikube
  kubectl
  iterm2
  node
  npm
  nvm
  vi-mode
  fzf
  ripgrep
  gitignore
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
)

# Aliases
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# virtualenvwrapper
WORKON_HOME=$HOME/.virtualenvs

# tmux - support 256 colors
[ -z "$TMUX" ] && TERM="alacritty"

# >>> z >>>
. $(brew --prefix)/etc/profile.d/z.sh
# <<< z <<<

# >>> Alacritty >>>
fpath+=${ZDOTDIR:-~}/.zsh_functions
# cp extra/completions/_alacritty ${ZDOTDIR:-~}/.zsh_functions/_alacritty
# <<< Alacritty <<<

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

# TODO: Probably not needed anymore
# anaconda
# ANACONDA=".anaconda3"
# ANACONDA_ADDITIONAL_PATHS=($HOME/Documents/projects/dsci)
# export PATH=$HOME/.anaconda3/bin:$PATH

# java
# export JAVA_HOME="$HOME/jdk1.8.0_102"
# PATH=$PATH:$JAVA_HOME/bin

# hadoop
# export HADOOP_HOME="$HOME/hadoop-2.7.3"

# >>> NVM >>>
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# <<< NVM <<<

CURL_CA_BUNDLE='/etc/ssl/certs/ca-certificates.crt'

# The next line updates PATH for the Google Cloud SDK.
# source $HOME/google-cloud-sdk/path.zsh.inc

# The next line enables shell command completion for gcloud.
# source $HOME/google-cloud-sdk/completion.zsh.inc

# export PATH=$PATH:$HOME/google_appengine

# mecab
export PATH=$PATH:/usr/local/Cellar/mecab/0.996/libexec/mecab/

# torch
# . $HOME/torch/install/bin/torch-activate

# TODO: Revisit Miniconda vs Miniforge
# >>> Miniconda/Miniforge >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< Miniconda/Miniforge <<<

# Custom aliases
# source $HOME/dev-work.sh

# >>> Haskell >>>
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"
# <<< Haskell <<<

# >>> Vim >>>
# Use Neovim as "preferred editor"
export VISUAL=nvim
export VIMCONFIG=$HOME/.config/nvim
export VIMDATA=$HOME/.local/share/nvim
# <<< Vim <<<

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# For `zsh-completions`
# autoload -U compinit && compinit

# >>> Bat >>>
export BAT_THEME="gruvbox-dark"
# <<< Bat <<<

# >>> Julia
export JULIA_NUM_THREADS=6
# <<< Julia

# Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship

# >>> libxslt >>>
export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"
# <<< libxslt <<<

# Make sure that this is the last thing that gets executed
source $ZSH/oh-my-zsh.sh
