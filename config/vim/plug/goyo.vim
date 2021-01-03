" so Goyo
function! s:goyo_enter()
  set notermguicolors
  set background=dark
  let t:is_transparent = 1
endfunction

function! s:goyo_leave()
  set termguicolors
  hi Normal guibg=NONE ctermbg=NONE
  let t:is_transparent = 0
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
map <leader>go :Goyo \| set linebreak<CR>


" Vim transparency
let t:is_transparent = 0
function! Toggle_transparent_background()
  if t:is_transparent == 0
    hi Normal guibg=#272827 ctermbg=12
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE
    let t:is_transparent = 0
  endif
endfunction
nnoremap <leader>t :call Toggle_transparent_background()<CR>

