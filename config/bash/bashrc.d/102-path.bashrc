
export PATH=\
$HOME/bin:\
$HOME/go/bin:\
$HOME/.cargo/bin:\
$HOME/.node/bin:\
$HOME/.deno/bin:\
$HOME/.local/bin:\
/usr/local/go/bin:\
/usr/local/bin:\
/usr/local/sbin:\
/usr/games:\
/usr/sbin:\
/usr/bin:\
/snap/bin:\
/sbin:\
/bin

# set PATH so it includes user's private bin if it exists
#   if [ -d "$HOME/bin" ] ; then
#     PATH="$HOME/bin:$PATH"
#   fi

# The next line updates PATH for Netlify's Git Credential Helper.
# if [ -f '$HOME/.netlify/helper/path.zsh.inc' ]; then source '$HOME/.netlify/helper/path.zsh.inc'; fi

# NODE NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# DENO
export DENO_INSTALL="$HOME/.deno"

# PYTHON PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# move to .bash_profile in case of infinit loop
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ANDROID SDK
export ANDROID_SDK="$HOME/Code/Android/Sdk"

# GO LANG
export GOROOT=/usr/local/go
export GOPATH=$HOME/.local/
#export PATH=$PATH:$GOROOT/bin

# MY BASH SCRIPTS
export BASH_SCRIPT=$HOME/.local/bin/bash-scripts
export PATH=$BASH_SCRIPT:$PATH

# NEOVIM NIGHTLY
#export PATH="$HOME/.nvim-linux64/bin"

