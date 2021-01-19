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

# nvm
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/.anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/.anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/.anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/.anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Custom aliases
source $HOME/Documents/lfkml/box-proxy/tools/lfk.sh

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

# Make sure that this is the last thing that gets executed
source $ZSH/oh-my-zsh.sh

