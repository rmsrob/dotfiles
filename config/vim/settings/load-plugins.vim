" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $HOME/.vimrc
endif

" Do not install Vim Plugins if Plug is not here
if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin('~/.vim/plugged')
  Plug 'mhinz/vim-startify'
  Plug 'rhysd/vim-healthcheck'
  " Text Navigation
  " Plug 'justinmk/vim-sneak'
  " Add some color
  Plug 'luochen1990/rainbow'
  Plug 'KabbAmine/vCoolor.vim'
  " Plug 'norcalli/nvim-colorizer.lua'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Plug 'evanleck/vim-svelte', {'branch': 'main'}
  " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  " Cool Icons
  Plug 'ryanoasis/vim-devicons'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Have the file system follow you around
  Plug 'airblade/vim-rooter'
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'mbbill/undotree'
  " Distraction free layout
  Plug 'junegunn/goyo.vim'
  " Snippets
  " Plug 'honza/vim-snippets'
  " Find and replace
  " Plug 'ChristianChiarulli/far.vim'
  " Comments
  " Plug 'suy/vim-context-commentstring'
  Plug 'preservim/nerdcommenter'
  " Auto pairs for '(' '[' '{'
  Plug 'jiangmiao/auto-pairs'
  " Closetags
  Plug 'alvan/vim-closetag'
  " Auto change html tags
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'dpelle/vim-LanguageTool'
  " Markdown Preview
  " Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
  " Plug 'vim-pandoc/vim-pandoc'
  " Plug 'https://gitlab.com/rwxrob/vim-pandoc-syntax-simple'
  " Multiple Cursors
  " Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  " Themes
  " Plug 'christianchiarulli/onedark.vim'
  " Plug 'sainnhe/sonokai'
  Plug 'gruvbox-community/gruvbox'
  " Status Line
  Plug 'vim-airline/vim-airline'
  call plug#end()
else
  echo 'hey maybe think about it... or not!'
endif

" Automatically install missing plugins on startup
autocmd VimEnter *
  \ if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|  PlugInstall --sync | q
  \| endif

