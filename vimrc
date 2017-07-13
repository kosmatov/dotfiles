let mapleader=","
scriptencoding utf-8
set encoding=utf-8

if has("vim_starting")
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand("~/.vim/bundle/"))

NeoBundleFetch "Shougo/neobundle.vim"
" NeoBundle "Shougo/vimproc", { "build" : { "linux" : "make" } }
NeoBundle "tpope/vim-fugitive"

NeoBundle "Lokaltog/vim-easymotion"
nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase=1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

NeoBundle "L9" " FuzzyFinder dependency
NeoBundle "FuzzyFinder"
NeoBundle "rails.vim"
NeoBundle "kien/ctrlp.vim"

NeoBundle "scrooloose/nerdtree"
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFind<CR>

NeoBundle "scrooloose/syntastic"
NeoBundle "jeetsukumaran/vim-buffergator"
NeoBundle "skalnik/vim-vroom"

NeoBundle "majutsushi/tagbar"
map <Leader>rt :TagbarToggle<CR>

NeoBundle "ervandew/supertab"
NeoBundle "tpope/vim-unimpaired"
NeoBundle "ddollar/nerdcommenter"
" NeoBundle "mattn/flappyvird-vim"

" Syntax hightlighters & lang support
NeoBundle "pangloss/vim-javascript"
NeoBundle "kchmck/vim-coffee-script"
NeoBundle "tpope/vim-haml"
NeoBundle "tpope/vim-markdown"
NeoBundle "tpope/vim-rails"
NeoBundle "slim-template/vim-slim"
NeoBundle "sunaku/vim-ruby-minitest"
NeoBundle "skwp/vim-rspec"
NeoBundle "vim-ruby/vim-ruby"
NeoBundle "ecomba/vim-ruby-refactoring"
" NeoBundle "tpope/vim-rvm"
NeoBundle "szw/vim-tags"
" NeoBundle "fatih/vim-go"
" NeoBundle "wting/rust.vim"
NeoBundle "guns/vim-clojure-static"
NeoBundle "tpope/vim-fireplace"
syntax enable
au BufNewFile,BufRead *.slim setf slim

call neobundle#end()

let g:go_disable_autoinstall = 1

filetype plugin indent on

set background=dark
:hi ColorColumn ctermbg=0
:hi TabLine ctermbg=0

set tabstop=2
set shiftwidth=2
set softtabstop=2
set list listchars=trail:·
set smarttab
set expandtab

set textwidth=79
set formatoptions=qrn1
set nowrap
" set colorcolumn=80
set incsearch

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap ; :

au FocusLost * :wa
autocmd BufEnter * lcd %:p:h

set shortmess+=A
set nohlsearch
set wildignore+=*/tmp/*,*/node_modules/*,*/public/assets*,*/vendor/*,*/coverage/*,*/.bundle/*,*/log/*,*/.git/*
