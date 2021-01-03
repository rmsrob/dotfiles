## CDPATH ALIAS
# alias repo='cd $HOME/Repos/ && ls -alF'
# alias rgithub='cd $HOME/Repos/github.com && ls -alF'
# alias rgitlab='cd $HOME/Repos/gitlab.com && ls -alF'
# alias dotfile='cd $HOME/Repos/gitlab.com/rmsrob/dotfiles && ls -alF'
# alias bookmark='cd $HOME/Repos/gitlab.com/rmsrob/bookmarks && ls -alF'
# alias cprod='cd $HOME/Code/Prod/ && ls -alF'
# alias ctest='cd $HOME/Code/Test/ && ls -alF'
# alias cdocker='cd $HOME/Code/Docker/ && ls -alF'

GITUSER="rmsrob"

export REPOS="$HOME/Repos/"
export GITLAB="$HOME/Repos/gitlab.com"
export RMSROB="$HOME/Repos/gitlab.com/$GITUSER"
export DOTFILES="$HOME/Repos/gitlab.com$GITUSER/dotfiles"
export GITHUB="$HOME/Repos/github.com"
export GHRR="$HOME/Repos/github.com/$GITUSER"

# Be sure not to remove ./ or stuff gets weird
export CDPATH=\
./:\
$REPOS:\
$GITLAB:\
$RMSROB:\
$GITHUB:\
$HOME


alias mycdpath='echo $CDPATH'
