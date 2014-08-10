# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="monokai-prose"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(anaconda django git git-extras mercurial node python pyenv tmux virtualenv virtualenvwrapper z)

source $ZSH/oh-my-zsh.sh

# Aliases
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# virtualenvwrapper
WORKON_HOME=$HOME/.virtualenvs

# tmux - support 256 colors
TERM="xterm-256color"

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"

if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi

# anaconda
ANACONDA=".anaconda"
ANACONDA_ADDITIONAL_PATHS=($HOME/Documents/numerical)

# hadoop
export HADOOP_HOME="/usr/lib/"
