" undotree

if has("persistent_undo")
  set undodir=$HOME."/.if has("persistent_undo")
  set undodir=$HOME."/.vim/undodir"
endif

nnoremap <leader>ut :UndotreeToggle<cr>
