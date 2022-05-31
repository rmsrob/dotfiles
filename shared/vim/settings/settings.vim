set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

syntax enable                           " Enables syntax highlighing
syntax on
filetype plugin on
filetype plugin indent on
set noerrorbells
set autowrite
set listchars=tab:→\ ,eol:↲,nbsp:␣,space:·,trail:·,extends:⟩,precedes:⟨
set viminfo='20,<1000,s1000 		        " prevents truncated yanks, deletes, etc.
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              		              " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line or 0 if not
set linebreak				                    " prevent Vim from automatically inserting line breaks
set number                              " Line numbers
set relativenumber
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess=aoOtI    		              " avoid most of the 'Hit Enter ...' messages
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set icon
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch
set nohlsearch
set noshowmatch
set spell spelllang+=en_us,fr
set smartcase
set scrolloff=16
set textwidth=73
set undodir=~/.vim/undodir
set undofile
set noswapfile
set ttyfast
set exrc
set secure
set foldmethod=manual			" manual foldingdefault (zf/zd)

" set mmp=1300
" set autochdir                         " Your working directory will always be the same as your working directory
" set foldcolumn=2                      " Folding abilities

