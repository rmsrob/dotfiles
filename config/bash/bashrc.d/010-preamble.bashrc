# shell must be interactive
[[ $- != *i* ]] && return

# reset all aliases
unalias -a

set -o vi
set keymap vi
set editing-mode vi
set -o notify
set -o ignoreeof

