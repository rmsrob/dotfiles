#!bash

# RMSROB >> exportable Bashrc :: Linux and Mac Friendly
# shell must be interactive

case $- in
*i*) ;;
*) return ;; 
esac

# ------------------------- platform & os detection -------------------------

[ -z "$OS" ] && export OS=`uname`
case "$OS" in
  Linux)          export PLATFORM=Linux ;;
  *indows*)       export PLATFORM=Windows ;;
  FreeBSD|Darwin) export PLATFORM=Mac ;;
  *)              export PLATFORM=unknown ;;
esac

export PLATFORM OS

# ---------------------- local utility functions ---------------------

_have()      { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ----------------------
# (also see envx)
# user = bob
# anon = bbob

export USER="${USER:-$(whoami)}"
export ANON="${ANON:-${USER:0:1}}$USER"
export GITUSER="$USER"
export GITANON="$ANON"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export GHREPOSEANON="$REPOS/github.com/$GITANON"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export PUBLIC="$HOME/Public"
export PRIVATE="$HOME/Private"
export PICTURES="$HOME/Pictures"
export MUSIC="$HOME/Music"
export VIDEOS="$HOME/Videos"
export VMS="$HOME/Vms"
export TERM=xterm-256color
export HRULEWIDTH=73
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export GOPRIVATE="github.com/$GITUSER/*,github.com/$GITANON/*,gitlab.com/$GITUSER/*"
export GOPATH="$HOME/.local/share/go"
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0
export NVM_DIR="$HOME/.nvm"
export NODE_PATH="${NODE_PATH:-$(which node)}"
export HOMEBREW="/opt/homebrew/bin"
# export PYTHONDONTWRITEBYTECODE=2 # WTF var name
export LC_COLLATE=C
export LANG=en_US.UTF-8
export TZ=Europe/Paris
export LC_TME=fr_FR
export LC_MESSAGES=C
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TZ=Europe/Paris
export LC_TME=fr_FR
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"

export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me="" # "0m"
export LESS_TERMCAP_se="" # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue="" # "0m"
export LESS_TERMCAP_us="[4m"  # underline

# export ANSIBLE_INVENTORY="$HOME/.config/ansible/ansible_hosts"
export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock

# [[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# -------------------------------- gpg -------------------------------

#export GPG_TTY=$(tty)

# ------------------------------- pager ------------------------------

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [[ $PLATFORM = Mac ]]; then
  if ! havecmd gls; then
    echo 'Need to `brew install coreutils` for Mac to work.'
  fi 
fi

if [[ -x /usr/bin/lesspipe ]]; then
  export LESSOPEN="| /usr/bin/lesspipe %s";
  export LESSCLOSE="/usr/bin/lesspipe %s %s";
fi

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
  else
    eval "$(dircolors -b)"
  fi
fi

# ------------------------------- path -------------------------------

pathappend() {
  declare arg
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//":$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="${PATH:+"$PATH:"}$arg"
  done
} && export pathappend

pathprepend() {
  for arg in "$@"; do
    test -d "$arg" || continue
    PATH=${PATH//:"$arg:"/:}
    PATH=${PATH/#"$arg:"/}
    PATH=${PATH/%":$arg"/}
    export PATH="$arg${PATH:+":${PATH}"}"
  done
} && export pathprepend

# remember last arg will be first in path
pathprepend \
  /usr/local/bin \
  "$HOME/.local/bin" \
  "$HOMEBREW" \
  "$NVM_DIR"* \
  "$NODE_PATH" \
  "$GHREPOS/cmd-"* \
  "$SCRIPTS" 

pathappend \
  /usr/local/opt/coreutils/libexec/gnubin \
  /opt/homebrew/opt/coreutils/libexec/gnubin \
  /mingw64/bin \
  /usr/local/bin \
  /usr/local/sbin \
  /usr/local/games \
  /usr/games \
  /usr/sbin \
  /usr/bin \
  /snap/bin \
  /sbin \
  /bin

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$GHREPOS:$GHREPOSEANON:$DOTFILES:$REPOS:/media/$USER:$HOME"

# ------------------------ bash shell options ------------------------

set bell-style none
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

#shopt -s nullglob # bug kills completion for some
#set -o noclobber

shopt -s autocd
shopt -s cdspell

# -------------------------- stty annoyances -------------------------

stty stop undef # disable control-s accidental terminal stops

# ------------------------------ history -----------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double\
    r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  countme="$USER$PROMPT_AT$(hostname):$dir($B)\$ "

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="$g($b$B$g)"

  short="$u\u$g$PROMPT_AT$h\h$g:$w$dir$B$p$P$x "
  long="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir$B\n$g╚ $p$P$x "
  double="$g╔ $u\u$g$PROMPT_AT$h\h$g:$w$dir\n$g║ $B\n$g╚ $p$P$x "

  if (( ${#countme} > PROMPT_MAX )); then
    PS1="$double"
  elif (( ${#countme} > PROMPT_LONG )); then
    PS1="$long"
  else
    PS1="$short"
  fi
}

PROMPT_COMMAND="__ps1"

# ----------------------------- keyboard -----------------------------

_have setxkbmap && test -n "$DISPLAY" && \
  setxkbmap -option caps:escape &>/dev/null

# Cycle through history based on characters already typed on the line ???
# bind "\C-p":history-search-backward
# bind "\C-m":history-search-forward
bind '"\e[1;5A":history-search-backward'
bind '"\e[1;5B":history-search-forward'
bind '"\e[1;5C":forward-word'
bind '"\e[1;5D":backward-word'

# If there are multiple matches for completion, Tab should cycle through them
#[[ $- = *i* ]] && bind TAB:menu-complete
bind TAB:menu-complete
# bind "\e[1;2A":menu-complete
# bind "\e[1;2B":menu-complete-backward

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"
bind "set show-all-if-unmodified on"
bind "set skip-completed-text off"

# ------------------------------ aliases -----------------------------
#      (use exec scripts instead, which work from vim and subprocs)

unalias -a
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkd='mkdir -pv'
alias destroy='shred -uv'
alias lessf="less +F"
alias hl="highlight --out-format=ansi"
alias grep="grep --color=always -r"
alias fgrep="fgrep --color=always -r"
alias egrep="egrep --color=always -r"
alias wget='wget -c'
alias ping='ping -c 4'
alias '?'=duck
alias '??'=google
alias '???'=bing
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias ls='ls -h --color=auto'
_have lsd && alias ls='lsd'
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -l'
alias lt='lsd --tree'
alias free='free -h'
alias df='df -H'
alias du='du -ch'
alias chmox='chmod +x'
alias diff='diff --color'
alias g="git"
alias gam="git add .; git commit -m "
alias gpom="git push origin master"
alias temp='cd $(mktemp -d)'
alias clear='printf "\e[H\e[2J"'
alias c='printf "\e[H\e[2J"'

_have vim && alias vi=vim
_have lazygit && alias lg='lazygit'
_have nnn && alias n='nnn -e'
_have nnn && alias N='sudo -E nnn -dH'
_have nvim && alias nv='nvim'
_have rg && alias rgg="rg -i -M=50"

alias view='vi -R'

_have tmux && alias ktmux='tmux kill-server'
_have ytop && alias ytop='ytop -ps'
_have cointop && alias coint='cointop'
_have docker-compose && alias dc="docker-compose"

# ----------------------------- functions ----------------------------

envx() {
  local envfile="${1:-"$HOME/.env"}"
  [[ ! -e "$envfile" ]] && echo "$envfile not found" && return 1
  while IFS= read -r line; do
    name=${line%%=*}
    value=${line#*=}
    [[ -z "${name}" || $name =~ ^# ]] && continue
    export "$name"="$value"
  done < "$envfile"
} && export -f envx

[[ -e "$HOME/.env" ]] && envx "$HOME/.env"

now () {
  return echo "$1" $(date "+%A, %B %e, %Y, %l:%M:%S%p")
}

epoch () {
  date +%s
}

# Moves an existing thing to the same path and name but with
# ".preserved.<tstamp>" at the end and echoes the new location. Usually
# preferable to destroying what was previously there. Can be used to roll
# back changes transactionally.

preserve () {
  declare target="${1%/}"
  [[ ! -e "$target" ]] && return 1
  declare new="$target.preserved.$(tstamp)"
  mv "$target" "$new" 
  echo "$new" 
}

# Lists all the preserved files by matching the .preserved<tstamp> suffix.
# If passed an argument limits to only those preserved files matching that
# name (prefix).

lspreserved () {
  declare -a files
  if [[ -z "$1" ]]; then
      files=(*.preserved.[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
  else
      files=("$1".preserved.[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
  fi
  for i in "${files[@]}"; do
    echo "$i"
  done
}

lastpreserved () {
  mapfile -t  a < <(lspreserved "$1")
  declare n=${#a[@]}
  echo "${a[n-1]}"
}

rmpreserved () {
  while IFS= read -r line; do
    rm -rf "$line"
  done < <(lspreserved)
}

# Undos the last preserve performed on the given target.

unpreserve () {
  declare last=$(lastpreserved "$*")
  [[ -z "$last" ]] && return 1
  mv "$last" "${last%.preserved*}"
}

# ------------- source external dependencies / completion ------------

_have gh && . <(gh completion -s bash)
_have pandoc && . <(pandoc --bash-completion)
_have kubectl && . <(kubectl completion bash 2>/dev/null)
_have spotify && . <(spotify completion bash 2>/dev/null)
_have k && complete -o default -F __start_kubectl k
_have kind && . <(kind completion bash)
_have helm && . <(helm completion bash)
_have podman && _source_if "$HOME/.local/share/podman/completion"
_have docker && _source_if "$HOME/.local/share/docker/completion"
_have docker-compose && complete -F _docker_compose dc
_have brew && _source_if "/opt/homebrew/etc/bash_completion.d/"

# -------------------- personalized configuration --------------------

_source_if "$HOME/.bash_private"
