" Basic Key Mappings

" Leader key
let mapleader=" "
let localleader=" "
nnoremap <Space> <Nop>

nnoremap <leader>r :call ToggleLineNumber()<CR>

noremap 	<F4> :set list!<CR>
noremap 	<F5> :set hlsearch! hlsearch?<CR>
noremap 	<F7> :set spell!<CR>

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Return normal mod when ALT+hjkl
imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l

" Better indenting
vnoremap < <gv
vnoremap > >gv

" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Alternate way to save (exit normal/insert/visual mod and save)!!!!!
map <C-x> :w<CR>
imap <C-x> <C-o>:w<CR><Esc>
xnoremap <C-x> <Esc>:w<CR>

" <TAB>: completion.
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Alternative way to insert date
nnoremap <leader>da "=strftime("%a %d %b %Y")<CR>P
nnoremap <leader>dz "=strftime("%FT%T%z")<CR>P

" Show cusrsorline
nnoremap <leader>h :set cursorline!<CR>
nnoremap <leader>H :set cursorline! cursorcolumn!<CR>

" Creating code blocks in Markdownfiles
noremap <leader>mk <cr>i```bash<cr>```<Esc>O

