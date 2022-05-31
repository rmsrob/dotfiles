" GRUVBOX THEME

set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection='0'
let g:gruvbox_italic=1


colorscheme gruvbox


hi Normal cterm=NONE ctermbg=NONE ctermfg=NONE  ctermbg=NONE guibg=NONE

hi CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
hi CursorLineNr cterm=NONE ctermbg=NONE ctermfg=magenta guibg=NONE guifg=#f81ce6
" hi LineN cterm=NONE ctermbg=NONE ctermfg=darkgrey guibg=NONE guifg=NONE
" hi LineNr cterm=NONE ctermbg=NONE ctermfg=darkgrey guibg=NONE guifg=#cccccc
hi Visual guibg=#f81ce6 guifg=black

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

highlight SpellBad cterm=Underline ctermfg=NONE ctermbg=NONE term=Reverse gui=Undercurl guisp=#f81ce6 guibg=NONE guifg=#f81CE6
highlight SpellCap cterm=NONE ctermfg=NONE ctermbg=NONE term=Reverse gui=NONE guisp=cyan guibg=NONE guifg=#a59877
highlight SpellLocal cterm=Underline ctermfg=NONE ctermbg=NONE term=Reverse gui=Undercurl guisp=red guibg=NONE guifg=#F5BFD2
highlight SpellRare cterm=Underline ctermfg=NONE ctermbg=NONE term=Reverse gui=Undercurl guisp=green guibg=NONE guifg=#FF6100
