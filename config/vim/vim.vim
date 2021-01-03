" ### Settings > Universal Access > Typing > Repeat keys
" ### [#####-----------------] (Delay)
" ### [###################---] (Speed)

" General Settings
source $HOME/.vim/settings/load-plugins.vim
source $HOME/.vim/settings/settings.vim
source $HOME/.vim/settings/functions.vim
source $HOME/.vim/settings/mappings.vim
" source $HOME/.vim/settings/which-key.vim

" Theme
source $HOME/.vim/themes/syntax.vim
" source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.vim/themes/gruvbox.vim
" source $HOME/.config/nvim/themes/sonokai.vim
source $HOME/.vim/themes/airline.vim

" Plugins
source $HOME/.vim/plug/fzf.vim
source $HOME/.vim/plug/coc.vim
source $HOME/.vim/plug/polyglot.vim
source $HOME/.vim/plug/comment.vim
source $HOME/.vim/plug/colorender.vim
source $HOME/.vim/plug/goyo.vim
source $HOME/.vim/plug/git.vim
source $HOME/.vim/plug/undotree.vim
source $HOME/.vim/plug/closetags.vim
source $HOME/.vim/plug/tagalong.vim
source $HOME/.vim/plug/languagetool.vim
source $HOME/.vim/plug/start.vim
" source $HOME/.config/nvim/plug/sneak.vim

" Add paths to node and python here
" if !empty(glob("~/.config/nvim/paths.vim"))
"   source $HOME/.config/nvim/paths.vim
" endif

" pip install pynvim in home dir befor
if filereadable(expand("/usr/bin/python3"))
  let g:python3_host_prog = '$HOME/.pyenv/versions/3.8.3/bin/python'
endif

