############################### Completion ###############################

# Most completion is set near the function that uses it or internally inside
# the command itself using https://github.com/robmuh/cmdtab for completion.

# goes into ~/.inputrc
#bind "set completion-ignore-case on"
#bind "set show-all-if-ambiguous on"

export PROMPT_COMMAND="history -a; history -c; history -r"

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi


if [ $PLATFORM == mac ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi


