# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-z
)

source $ZSH/oh-my-zsh.sh

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'

# -------------------------------- #
# Directories
#
# I put
# `~/i` for my projects
# `~/f` for forks
# `~/r` for reproductions
# -------------------------------- #
function i() {
  cd ~/i/$1
}

function repros() {
  cd ~/r/$1
}

function forks() {
  cd ~/f/$1
}

function dir() {
  mkdir $1 && cd $1
}

function clone() {
  if [[ -z $2 ]] then
    hub clone "$@" && cd "$(basename "$1" .git)"
  else
    hub clone "$@" && cd "$2"
  fi
}

# Clone to ~/i and cd to it
function clonei() {
  i && clone "$@" && code . && cd ~2
}

function cloner() {
  repros && clone "$@" && code . && cd ~2
}

function clonef() {
  forks && clone "$@" && code . && cd ~2
}

function codei() {
  i
  if [ ! -d $@ ]; then
    mkdir $@
  fi

  code "$@" && cd -
}

# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/lazy/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# python env option
export PATH=$PATH:/Users/lazy/Library/Python/3.9/bin:/opt/homebrew/bin:/Users/lazy/apache-maven-3.9.6/bin//opt/homebrew/opt/openssl@3/bin
VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
source /Users/lazy/Library/Python/3.9/bin/virtualenvwrapper.sh

eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# load pyenv alias
[ -f ~/.pyenv_aliases ] && source ~/.pyenv_aliases

# load kubectl alias
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

# load git alias
[ -f ~/.git_aliases ] && source ~/.git_aliases

# load pip alias
[ -f ~/.pip_aliases ] && source ~/.pip_aliases

# load docker alias
[ -f ~/.docker_aliases ] && source ~/.docker_aliases

# proxy env settings
export https_proxy=http://127.0.0.1:7890 
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7890

# kubeapi env settings
export KUBECONFIG="/Users/lazy/admin.conf"

[ -f ~/.aliases ] && source ~/.aliases
