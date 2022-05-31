" set git stuff here

set signcolumn=yes
let g:gitgutter_set_sign_backgrounds = 1

hi SignColumn cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE

highlight GitGutterAdd    guifg=#00FF00 ctermfg=2
highlight GitGutterChange guifg=#00FFFF ctermfg=cyan
highlight GitGutterDelete guifg=#FF0000 ctermfg=1

let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_removed_above_and_below = ''
let g:gitgutter_sign_modified_removed = ''

