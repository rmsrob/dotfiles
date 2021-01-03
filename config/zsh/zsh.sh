# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="spaceship"

SPACESHIP_PROMPT_ORDER=(  
    time          # Time stampts section
    user          # Username section
    host          # Hostname section
    dir           # Current directory section
    git           # Git section (git_branch + git_status)
    hg            # Mercurial section (hg_branch  + hg_status)
    package       # Package version
    node          # Node.js section
    ruby          # Ruby section
    elm           # Elm section
    elixir        # Elixir section
    xcode         # Xcode section
    swift         # Swift section
    golang        # Go section
    php           # PHP section
    rust          # Rust section
    haskell       # Haskell Stack section
    julia         # Julia section
    docker        # Docker section
    aws           # Amazon Web Services section
    venv          # virtualenv section
    conda         # conda virtualenv section
    pyenv         # Pyenv section
    dotnet        # .NET section
    ember         # Ember.js section
    kubectl       # Kubectl context section
    terraform     # Terraform workspace section
    exec_time     # Execution time
    line_sep      # Line break
#    battery       # Battery level and status
    vi_mode       # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character  
)
# PROMPT
SPACESHIP_CHAR_PREFIX=" "
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL="➜"
SPACESHIP_CHAR_SYMBOL_ROOT="$SPACESHIP_CHAR_SYMBOL"
SPACESHIP_CHAR_SYMBOL_SECONDARY="$SPACESHIP_CHAR_SYMBOL"
SPACESHIP_CHAR_COLOR_SUCCESS="green"
SPACESHIP_CHAR_COLOR_FAILURE="red"
SPACESHIP_CHAR_COLOR_SECONDARY="yellow"

# TIME
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX="at "
SPACESHIP_TIME_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_TIME_FORMAT=false
SPACESHIP_TIME_12HR=false
SPACESHIP_TIME_COLOR="black"

# USER
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_PREFIX=" "
SPACESHIP_USER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_USER_COLOR="cyan"
SPACESHIP_USER_COLOR_ROOT="red"

# HOST
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_SHOW_FULL=true
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_HOST_COLOR="green"
SPACESHIP_HOST_COLOR_SSH="red"

# DIR
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_PREFIX=" ᜶  "
SPACESHIP_DIR_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_PREFIX=" "
SPACESHIP_DIR_TRUNC_REPO=true
SPACESHIP_DIR_LOCK_SYMBOL=""
SPACESHIP_DIR_LOCK_COLOR="red"
SPACESHIP_DIR_COLOR="cyan"

# GIT
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_PREFIX=" "
SPACESHIP_GIT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_GIT_SYMBOL=" "

# GIT BRANCH
SPACESHIP_GIT_BRANCH_SHOW=true
SPACESHIP_GIT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_BRANCH_COLOR="magenta"

# GIT STATUS
SPACESHIP_GIT_STATUS_SHOW=true
SPACESHIP_GIT_STATUS_PREFIX=" ["
SPACESHIP_GIT_STATUS_SUFFIX="]"
SPACESHIP_GIT_STATUS_COLOR="red"
SPACESHIP_GIT_STATUS_UNTRACKED="?"
SPACESHIP_GIT_STATUS_ADDED="+"
SPACESHIP_GIT_STATUS_MODIFIED="!"
SPACESHIP_GIT_STATUS_RENAMED="»"
SPACESHIP_GIT_STATUS_DELETED="✘"
SPACESHIP_GIT_STATUS_STASHED="$"
SPACESHIP_GIT_STATUS_UNMERGED="="
SPACESHIP_GIT_STATUS_AHEAD="⇡"
SPACESHIP_GIT_STATUS_BEHIND="⇣"
SPACESHIP_GIT_STATUS_DIVERGED="⇕"

# RUBY
SPACESHIP_RUBY_SHOW=true
SPACESHIP_RUBY_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_RUBY_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_RUBY_SYMBOL="💎 "
SPACESHIP_RUBY_COLOR="red"
# XCODE
SPACESHIP_XCODE_SHOW_LOCAL=true
SPACESHIP_XCODE_SHOW_GLOBAL=false
SPACESHIP_XCODE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_XCODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_XCODE_SYMBOL="🛠 "
SPACESHIP_XCODE_COLOR="blue"
# SWIFT
SPACESHIP_SWIFT_SHOW_LOCAL=true
SPACESHIP_SWIFT_SHOW_GLOBAL=false
SPACESHIP_SWIFT_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_SWIFT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_SWIFT_SYMBOL="🐦 "
SPACESHIP_SWIFT_COLOR="yellow"
# GOLANG
SPACESHIP_GOLANG_SHOW=true
SPACESHIP_GOLANG_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_GOLANG_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_GOLANG_SYMBOL="🐹 "
SPACESHIP_GOLANG_COLOR="cyan"
# PHP
SPACESHIP_PHP_SHOW=true
SPACESHIP_PHP_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_PHP_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_PHP_SYMBOL="🐘 "
SPACEHIP_PHP_COLOR="blue"
# RUST
SPACESHIP_RUST_SHOW=true
SPACESHIP_RUST_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_RUST_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_RUST_SYMBOL="🦀 "
SPACESHIP_RUST_COLOR="red"
# PYENV
SPACESHIP_PYENV_SHOW=true
SPACESHIP_PYENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_PYENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_PYENV_SYMBOL="🐍 "
SPACESHIP_PYENV_COLOR="yellow"
# NODE
SPACESHIP_NODE_SHOW=true
SPACESHIP_NODE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_NODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_NODE_SYMBOL="⬢ "
SPACESHIP_NODE_DEFAULT_VERSION=""
SPACESHIP_NODE_COLOR="green"
# VENV
SPACESHIP_VENV_SHOW=true
SPACESHIP_VENV_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"
SPACESHIP_VENV_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_VENV_COLOR="blue"
# DOCKER
SPACESHIP_DOCKER_SHOW=true
SPACESHIP_DOCKER_PREFIX="on "
SPACESHIP_DOCKER_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_DOCKER_SYMBOL="🐳 "
SPACESHIP_DOCKER_COLOR="cyan"
# VI_MODE
SPACESHIP_VI_MODE_SHOW=true
SPACESHIP_VI_MODE_PREFIX=""
SPACESHIP_VI_MODE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"
SPACESHIP_VI_MODE_INSERT="[I]"
SPACESHIP_VI_MODE_NORMAL="[N]"
SPACESHIP_VI_MODE_COLOR="white"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(tmux extract git git-extras)
plugins=(git extract zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions command-not-found)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
# source plugins
# source $ZSH/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $ZSH/custom/plugins/zsh-history-substring-search.zsh
# source $ZSH/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LANG=en_US.UTF-8
export TZ=Europe/Paris
export LC_TME=fr_FR
export LC_MESSAGES=C
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
TZ=Europe/Paris
LC_TME=fr_FR

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

export VISUAL=code
export BROWSER=$(which google-chrome firefox chromium-browser links2 links lynx | grep -Pm1 '^/')

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#. /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh

# bindkey -v
# bindkey '^P' up-history
# bindkey '^N' down-history
# bindkey '^?' backward-delete-char
# bindkey '^h' backward-delete-char
# bindkey '^w' backward-kill-word
# bindkey '^r' history-incremental-search-backward

# setxkbmap -option caps:swapescape
# setxkbmap -option 'caps:ctrl_modifier'  
# xcape -e 'Caps_Lock=Escape'

# Transforme
alias yaml2json="python3 -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=2, sort_keys=False)'"
alias json2yaml="python3 -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, indent=2, default_flow_style=False)'"
alias json="python -m 'json.tool'"

# Ls
alias ls='lsd'
alias ll='ls -alF'
alias la='ls -lA'
alias l='ls -l'
alias lt='lsd --tree'

## Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'


alias cp='cp -i'
alias mv='mv -i'
alias lessf="less +F"

# use coloration in grep search
alias grep="grep --color=always -r"
alias fgrep="fgrep --color=always -r"
alias egrep="egrep --color=always -r"

## NETWORK ##
alias wget='wget -c'
alias ping='ping -c 4'

## set some other defaults ##
alias df='df -H'
alias du='du -ch'
alias nano='nano -c'
alias vi='nvim'

## top is atop ##
alias ktmux='tmux kill-server'

## docker
alias dc="docker-compose"

# The next line updates PATH for Netlify's Git Credential Helper.
if [ -f '/home/rems/.netlify/helper/path.zsh.inc' ]; then source '/home/rems/.netlify/helper/path.zsh.inc'; fi

# NODE NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PYTHON PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# move to .bash_profile in case of infinit loop
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ANDROID SDK
export ANDROID_SDK="$HOME/Code/Android/Sdk"

# HASURA CLI & MORE...
if [ -f "$ZSH/completions/_hasura" ]; then source "$ZSH/completions/_hasura"; fi

# GO LANG
export GOROOT=/usr/local/go
export GOPATH=$HOME/.local/
export PATH=$PATH:$GOROOT/bin

# MY SCRIPTS
export INSTALL_PATH=$HOME/.local/bin
export PATH=$INSTALL_PATH:$PATH
export PATH=$INSTALL_PATH/scripts:$PATH
