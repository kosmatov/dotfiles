let mapleader=","
scriptencoding utf-8
set encoding=utf-8

set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'skalnik/vim-vroom'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'tpope/vim-unimpaired'
Plug 'ddollar/nerdcommenter'
" Plug 'mattn/flappyvird-vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" Syntax hightlighters & lang support
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'slim-template/vim-slim'
Plug 'sunaku/vim-ruby-minitest'
Plug 'skwp/vim-rspec'
Plug 'vim-ruby/vim-ruby'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'szw/vim-tags'
" Plug 'fatih/vim-go'
" Plug 'wting/rust.vim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'

" Styles
Plug 'vim-airline/vim-airline'
Plug 'mhartington/oceanic-next'
Plug 'mhinz/vim-janah'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'iCyMind/NeoSolarized'
Plug 'joshdick/onedark.vim'

call plug#end()

syntax enable
set noshowmode
au BufNewFile,BufRead *.slim setf slim

hi VertSplit cterm=NONE ctermbg=NONE ctermfg=Black guibg=NONE

nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase=1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
filetype plugin indent on

let g:go_disable_autoinstall = 1

map <C-n> :NERDTreeToggle \| BuffergatorClose<CR>
map <Leader>n :NERDTreeFind<CR>
map <Leader>rt :TagbarToggle<CR>

set background=dark
:hi ColorColumn ctermbg=0
:hi TabLine ctermbg=0

highlight DiffAdd cterm=bold ctermfg=10 ctermbg=17
highlight DiffText cterm=bold ctermfg=10 ctermbg=88
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17

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

if &diff
  nnoremap <up> :<up>
  nnoremap <down> :<down>
endif

nnoremap ; :

au FocusLost * :wa
" autocmd BufEnter * lcd %:p:h

set shortmess+=A
set nohlsearch
set wildignore+=*/tmp/*,*/node_modules/*,*/public/assets*,*/vendor/*,*/coverage/*,*/.bundle/*,*/log/*,*/.git/*,*/cassettes/*
