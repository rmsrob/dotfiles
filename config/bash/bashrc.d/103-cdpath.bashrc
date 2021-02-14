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
export GITHUB="$HOME/Repos/github.com"
export RRHUB="$HOME/Repos/github.com/$GITUSER"
export DOTFILES="$HOME/Repos/github.com/$GITUSER/dotfiles"
export CONFFILES="$HOME/Repos/github.com/$GITUSER/dotfiles/config"
export GITLAB="$HOME/Repos/gitlab.com"
export RRLAB="$HOME/Repos/gitlab.com/$GITUSER"

# Be sure not to remove ./ or stuff gets weird
export CDPATH=\
./:\
$REPOS:\
$GITHUB:\
$RRHUB:\
$CONFFILES:\
$GITLAB:\
$RRLAB:\
$HOME


alias mycdpath='echo $CDPATH'
