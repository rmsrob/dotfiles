export LANG=en_US.UTF-8
export LANG=en_US.UTF-8
export TZ=Europe/Paris
export LC_TME=fr_FR
export LC_MESSAGES=C
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TZ=Europe/Paris
export LC_TME=fr_FR



if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

export VISUAL="vim"
export EDITOR='vi'

export BROWSER=$(which brave-browser-beta brave chromium-browser lynx google-chrome firefox  | grep -Pm1 '^/')
export READER=""
export VIDEO="vlc"
export TERMINAL="alacritty"

