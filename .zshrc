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

# http proxy
export http_proxy=http://`route -n | awk '{print $2}' | grep 172`:7890
export https_proxy=http://`route -n | awk '{print $2}' | grep 172`:7890

# go setting
export GOPATH=/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# kubeapi env settings
export KUBECONFIG="/Users/lazy/admin.conf"

# fnm
FNM_PATH="/root/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

[ -f ~/.aliases ] && source ~/.aliases
