#!bash

# RMSROB >> exportable Bashrc :: Linux and Mac Friendly
# shell must be interactive

case $- in
*i*) ;;
*) return ;;
esac

# ------------------------- platform & os detection -------------------------

[ -z "$OS" ] && export OS=$(uname)
case "$OS" in
Linux) export PLATFORM=Linux ;;
*indows*) export PLATFORM=Windows ;;
FreeBSD | Darwin) export PLATFORM=Mac ;;
*) export PLATFORM=unknown ;;
esac

export PLATFORM OS

# ---------------------- local utility functions ---------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }
# _dir_exist() if [[ ! -d "$1" ]] then echo Hey $USER should you create "$1" fi

# ----------------------- environment variables ----------------------
# (also see envx)

export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export REPOS="$HOME/Repos"
export GHDIR="$REPOS/github.com"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/.local/scripts"
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export PUBLIC="$HOME/Public"
export PRIVATE="$HOME/Private"
export PICTURES="$HOME/Pictures"
export MUSIC="$HOME/Music"
export VIDEOS="$HOME/Videos"
export VMS="$HOME/Vms"
export NVIM_DIR="$HOME/.nvim" # testing nightly
export TERM=xterm-256color
export HRULEWIDTH=84
export EDITOR=vi
export VISUAL=vi
export EDITOR_PREFIX=vi
export GOROOT="/opt/homebrew/Cellar/go/1.22.3/libexec"
export GOBIN="$HOME/.local/bin"
export GOPATH="$HOME/.local/share/go"
export CGO_ENABLED=0
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
export GOPROXY=direct
export HOMEBREW="/opt/homebrew/bin"
export HB_libpq="/opt/homebrew/opt/libpq/bin"
export FOUDRYBIN="$HOME/.foundry/bin"
# export NPM_NM="/opt/homebrew/lib/node_modules"
export PNPM_HOME="$HOME/.pnpm"
export BUN_INSTALL="$HOME/.bun"
export RUSTUP="$HOME/.cargo/bin"
export RUSTUPENV="$HOME/.cargo/env"
export CYFRIN="$HOME/.cyfrin/bin"
export RINDEXER="$HOME/.rindexer/bin"
# export PYTHONDONTWRITEBYTECODE=2 # WTF var name
export LC_COLLATE=C
export LANG=en_US.UTF-8
export LC_MESSAGES=C
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"

color_prompt=yes
alias fixstty='stty sane'

export escape=$'\033'
export reset=$'\033[0m'
export bold=$'\033[1m'
export underline=$'\033[4m'
export blinkon=$'\033[5m'
export blinkoff=$'\033[25m'
export inverse=$'\033[7m'
export inverseoff=$'\033[27m'
export normal=$'\033[39m'
export normalbg=$'\033[49m'

# DISABLE THIS ON MAC OSX
# export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock

# [[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# -------------------------------- gpg -------------------------------

#export GPG_TTY=$(tty)
# GPG_TTY=$(tty)
# export GPG_TTY

# ------------------------------- pager ------------------------------

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [[ -x /usr/bin/lesspipe ]]; then
  export LESSOPEN="| /usr/bin/lesspipe %s"
  export LESSCLOSE="/usr/bin/lesspipe %s %s"
fi

# ----------------------------- dircolors ----------------------------

if _have dircolors; then
  if [[ -r "$HOME/.dircolors" ]]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  else
    eval "$(dircolors -b)"
  fi
fi

export LESS_TERMCAP_mb="[35m" # magenta
export LESS_TERMCAP_md="[33m" # yellow
export LESS_TERMCAP_me=""      # "0m"
export LESS_TERMCAP_se=""      # "0m"
export LESS_TERMCAP_so="[34m" # blue
export LESS_TERMCAP_ue=""      # "0m"
export LESS_TERMCAP_us="[4m"  # underline

export NNN_COLORS='#0a1b2c3d;1234'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'

export JQ_null="38;5;160"
export JQ_false="38;5;214"
export JQ_true="38;5;214"
export JQ_num="38;5;200"
export JQ_string="38;5;42"
export JQ_arr="38;5;196"
export JQ_obj="38;5;51"
export JQ_field="38;5;244"

export JQ_COLORS="$JQ_null:$JQ_false:$JQ_true:$JQ_num:$JQ_string:$JQ_arr:$JQ_obj:$JQ_field"

EXT_COLOR() { echo -ne "\[\033[38;5;$1m\]"; }

rgb() {
  echo -n $'\033[38;2;'$1';'$2';'$3'm'
} && export -f rgb

rgbg() {
  echo -n $'\033[48;2;'$1';'$2';'$3'm'
} && export -f rgb

# ------------------------------- path -------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# WTF:FIX npx asking me to install the thing! if npm -v > 7
export npm_config_yes=true

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
  "$BUN_INSTALL/bin" \
  "$HOME/.local/bin" \
  "$HOMEBREW" \
  "$NVM_DIR"* \
  "$PNPM_HOME" \
  "$GHREPOS/cmd-"* \
  "$RUSTUP" \
  "$RUSTUPENV" \
  "$FOUDRYBIN" \
  "$NVIM_DIR/bin" \
  "$CYFRIN" \
  "$RINDEXER" \
  "$HB_libpq" \
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

# export NODE_PATH="${NODE_PATH:-$(which node | rev | cut -c6- | rev)}"
# export HOMEBREW="${HOMEBREW:-$(which brew | rev | cut -c6- | rev)}"

# ------------------------------ cdpath ------------------------------

export CDPATH=".:$GHREPOS:$DOTFILES:$GHDIR:$REPOS:/media/$USER:$HOME"

# ------------------------ bash shell options ------------------------

set bell-style none
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
#shopt -s cdable_vars
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

export no_color="\[\033[0m\]"
export pink="$(EXT_COLOR 198)"
export blackish="$(EXT_COLOR 238)"
export greyish="$(EXT_COLOR 245)"
export cyan="$(EXT_COLOR 51)"
export lime="$(EXT_COLOR 82)"
export yellow="$(EXT_COLOR 227)"
export white="$(EXT_COLOR 249)"
export orange="$(EXT_COLOR 202)"

__ps1() {
  PS_USER="$blackish\u$no_color"
  PS_AT="$greyish@$no_color"
  PS_XHOST="0x$((0x$(sha1sum <<<$(hostname))0))"
  PS_HEXHOST="$blackish${PS_XHOST::4}...${PS_XHOST:0-5}$no_color"
  PS_DIR="$cyan\w$no_color"

  function is_git_repository {
    git branch >/dev/null 2>&1
  }

  function set_git_branch {
    git_status="$(git status 2>/dev/null)"

    if [[ ${git_status} =~ "nothing to commit, working tree clean" ]]; then
      state="${lime}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
      state="${yellow}"
    else
      state="${pink}"
    fi

    remote_pattern="Your branch is (.*) of"
    if [[ ${git_status} =~ ${remote_pattern} ]]; then
      if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
        remote=""
      else
        remote="↓"
      fi
    else
      remote=""
    fi

    diverge_pattern="Your branch and (.*) have diverged"
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
      remote=""
    fi

    branch_pattern="^(# )?On branch ([^${IFS}]*)"
    if [[ ${git_status} =~ ${branch_pattern} ]]; then
      branch="${BASH_REMATCH[2]}"
    fi

    PS_BRANCH="${state}(${branch}) ${remote}${no_color} "
  }

  if is_git_repository; then
    set_git_branch
  else
    PS_BRANCH="$cyan.$no_color"
  fi

  if [ "$(whoami)" == "root" ]; then
    PS_SYMBOL="$pink# $no_color"
  else
    PS_SYMBOL="$lime$ $no_color"
  fi

  if [[ $PLATFORM = Linux ]]; then
    PS_ICOS="$orange$no_color"
  elif [[ $PLATFORM = Mac ]]; then
    PS_ICOS="$white  $no_color"
  else
    PS_ICOS="$lime  $no_color"
  fi

  prompt="\n$PS_ICOS $PS_USER$PS_AT$PS_HEXHOST $PS_DIR $PS_BRANCH\n $PS_SYMBOL ➜ "

  PS1="$prompt"
}

PROMPT_COMMAND="__ps1"

# ----------------------------- keyboard -----------------------------

_have setxkbmap && test -n "$DISPLAY" &&
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
alias cp='cp -iv'
alias mv='mv -iv'
alias mkd='mkdir -pv'
alias destroy='shred -uv'
alias lessf='less +F'
alias more='less'
alias hl='highlight --out-format=ansi'
alias grep='grep --color=always -r'
alias fgrep='fgrep --color=always -r'
alias egrep='egrep --color=always -r'
alias wget='wget -c'
alias ping='ping -c 4'
alias '?'=duck
alias '??'=google
alias '???'=gpt
alias ls='ls -h --color=auto'
_have lsd && alias ls='lsd'
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -l'
_have lsd && alias lt='lsd --tree -al'
alias free='free -h'
alias df='df -H'
alias du='du -ch'
alias chmodx='chmod +x'
alias diff='diff --color'
alias g='git'
alias gam='git add .; git commit -m '
alias temp='cd $(mktemp -d -t foobar.XXXXX)'
alias clear='printf "\e[H\e[2J"'
alias cll=clear
alias cdd=cd
alias view='vi -R'
alias oia='oai'
alias rindexerup='bash /Users/rmsrob/.rindexer/bin/rindexerup $@'
alias rindexerdown='bash /Users/rmsrob/.rindexer/bin/rindexerdown'

_have lazygit && alias lzg='lazygit'
_have lazydocker && alias lzd='lazydocker'
_have nnn && alias n='nnn -e'
_have nnn && alias N='sudo -E nnn -dH'
# _have vim && alias vi='vim'
# _have nvim && alias vim='nvim'
_have rg && alias rgg="rg -i -M=50"
_have tmux && alias ktmux='tmux kill-server'
_have ytop && alias ytop='ytop -ps'
_have cointop && alias coint='cointop'
_have docker-compose && alias dc="docker-compose"
_have podman-compose && alias pc="podman-compose"

# ----------------------------- functions ----------------------------

gpom() {
  branch_name=$(git branch --show-current)
  if [ "$branch_name" == "master" ] || [ "$branch_name" == "main" ]; then
    git push origin $branch_name
  else
    echo "Neither 'master' nor 'main' branch exists."
  fi
}

gpod() {
  branch_name=$(git branch --show-current)
  if [ "$branch_name" == "develop" ] || [ "$branch_name" == "dev" ]; then
    git push origin $branch_name
  else
    echo "Neither 'develop' nor 'dev' branch exists."
  fi
}

gsub() {
  git submodule deinit --force .
  git submodule update --init --recursive
  echo "discarded local changes in submodule and updated them."
}

now() {
  return echo "$1" $(date "+%A, %B %e, %Y, %l:%M:%S%p")
}

epoch() {
  date +%s
}

# Moves an existing thing to the same path and name but with
# ".preserved.<tstamp>" at the end and echoes the new location. Usually
# preferable to destroying what was previously there. Can be used to roll
# back changes transactionally.

preserve() {
  declare target="${1%/}"
  [[ ! -e "$target" ]] && return 1
  declare new="$target.preserved.$(tstamp)"
  mv "$target" "$new"
  echo "$new"
}

# Lists all the preserved files by matching the .preserved<tstamp> suffix.
# If passed an argument limits to only those preserved files matching that
# name (prefix).

# lspreserved () {
#   declare -a pfiles
#   if [[ -z "$1" ]]; then
#       pfiles=(*.preserved.[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
#   else
#       pfiles=("$1".preserved.[2-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9])
#   fi
#   for i in "${files[@]}"; do
#     echo "$i"
#   done
# }

lastpreserved() {
  mapfile -t a < <(lspreserved "$1")
  declare n=${#a[@]}
  echo "${a[n - 1]}"
}

rmpreserved() {
  while IFS= read -r line; do
    rm -rf "$line"
  done < <(lspreserved)
}

# Undos the last preserve performed on the given target.

unpreserve() {
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
# _have docker && _source_if "$HOME/.local/share/docker/completion"
_have docker-compose && complete -F _docker_compose dc
_have brew && _source_if "/opt/homebrew/etc/profile.d/bash_completion.sh"
_have forge && . <(forge completions bash)
_have cast && . <(cast completions bash)
_have anvil && . <(anvil completions bash)
# pnpm completion
[ -f ~/.config/tabtab/bash/__tabtab.bash ] && . ~/.config/tabtab/bash/__tabtab.bash || true

# -------------------- personalized configuration --------------------

envx() {
  local envfile="${1:-"$HOME/.env"}"
  [[ ! -e "$envfile" ]] && echo "$envfile not found" && return 1
  while IFS= read -r line; do
    name=${line%%=*}
    value=${line#*=}
    [[ -z "${name}" || $name =~ ^# ]] && continue
    export "$name"="$value"
  done <"$envfile"
} && export -f envx

[[ -e "$DOTFILES/.env" ]] && envx "$DOTFILES/.env"

_source_if "$HOME/.bash_private"
