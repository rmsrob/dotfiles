function set_bash_prompt () {
  NO_COLOUR="\[\033[0m\]"
  TAT="\[\e[34;1m\]"
  JS=`echo -e "\uE60c"`		# \uE60c  ⬢ 🧶
  TS=`echo -e "\ufbe4"`   # \ufbe4 ﯤ
  PY=`echo -e "\uF81f"`		# \uF81f  🐍
  DO=`echo -e "\uF308"`		# \uF308  🐳
  GO=`echo -e "\uFCD1"`		# \uFCD1 ﳑ 🐹
  AWS=`echo -e "\uFCD1 \uF270"`	# \uFCD1 \uF270 
  GCP=`echo -e "\uE7b2 \uF1a0"`	# \uE7b2 \uF1a0 
  AZR=`echo -e "\uFd03 \uF871"`	# \uFd03 \uF871 ﴃ
  VRC=`echo -e "\uFA35"`		# \uFA35 卑 🔺
  HKU=`echo -e "\uE77B"`		# \uE77B 

  # Change the symbol color based on user or root
  if [ "$(whoami)" == "root" ] ; then
    SYMBOL="`EXT_COLOR 198`# ${NO_COLOUR}";
  else
    SYMBOL="`EXT_COLOR 82`$ ${NO_COLOUR}";
  fi

  # Change the path color based on ssh or local
  if [[ $(who am i) =~ \([-a-zA-Z0-9\.]+\)$ ]] ; then

    ISSSH="`EXT_COLOR 226`ssh \u@\h${NO_COLOUR}";
  else
    ISSSH="`EXT_COLOR 82`@`EXT_COLOR 153`\h${NO_COLOUR}";
  fi

  # Change the path color based on return value.
  if test $? -eq 0 ; then PATH_COLOR=`EXT_COLOR 51`; else PATH_COLOR=`EXT_COLOR 198`; fi

  # Set the PS1 to be:
  PS1="${ISSSH} ${PATH_COLOR}\w${NO_COLOUR}"

  # Is a Node project?
  isinnode=`ls -1 package.json 2>/dev/null | wc -l`
  if [ $isinnode != 0 ]; then
    PS1="${PS1} `EXT_COLOR 221`${JS}${NO_COLOUR}"
  fi
  # Is a Python project ?
  if [ -d venv ] > /dev/null 2>&1; then
    PS1="${PS1} `EXT_COLOR 26`${PY}${NO_COLOUR}"
  fi
  # Is a GO project ?
  isingo=`ls -1 main.go 2>/dev/null | wc -l`
  if [ $isingo != 0 ]; then
    PS1="${PS1} `EXT_COLOR 51`${GO}${NO_COLOUR}"
  fi
  # Has a Docker files ?
  hasdocker=`ls -1 docker-compose.yml 2>/dev/null | wc -l`
  if [ $hasdocker != 0 ]; then
    PS1="${PS1} `EXT_COLOR 45`${DO}${NO_COLOUR}"
  fi

  # Add git branch portion of the prompt, this adds ":branchname"
  if ! git_loc="$(type -p "$git_command_name")" || [ -z "$git_loc" ]; then
    # Git is installed
    if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
      # Inside of a git repository check if need commit or not
      GIT_BRANCH=$(git symbolic-ref --short HEAD)
      [ -z "`git status --porcelain`" ] && PS1="${PS1} `EXT_COLOR 48` ${GIT_BRANCH}${NO_COLOUR}" || PS1="${PS1} `EXT_COLOR 164` ${GIT_BRANCH}${NO_COLOUR}"
    fi
  fi

  # Hosted on AWS ? TODO FIX how to know
  if [ -d .aws ] > /dev/null 2>&1; then
    PS1="${PS1} `EXT_COLOR 215`${AWS}${NO_COLOUR}"
  fi
  # Hosted on GCP ?
  ongcp=`ls -1 cloudbuild.yml 2>/dev/null | wc -l`
  if [ $ongcp != 0 ]; then
    PS1="${PS1} `EXT_COLOR 124`${GCP}${NO_COLOUR}"
  fi
  # Hosted on AZURE ? TODO FIX how to know
  onazur=`ls -1 azure.yml 2>/dev/null | wc -l`
  if [ $onazur != 0 ]; then
    PS1="${PS1} `EXT_COLOR 25`${AZR}${NO_COLOUR}"
  fi
  # Hosted on VERCEL ?
  if [ -d .vercel ] > /dev/null 2>&1; then
    PS1="${PS1} `EXT_COLOR 242`${VRC}${NO_COLOUR}"
  fi
  # Hosted on HEROKU ? TODO FIX how to know
  if [ -d .heroku ] > /dev/null 2>&1; then
    PS1="${PS1} `EXT_COLOR 93`${HKU}${NO_COLOUR}"
  fi

  # Shell tilte
  TITLE="\[\e]2;${OS}\]"

  # Close out the prompt"
  PS1="\n${TITLE}${PS1}\n ${SYMBOL} ➜`EXT_COLOR 250` "
}

# Tell Bash to run the above function for every prompt
export PROMPT_COMMAND=set_bash_prompt

