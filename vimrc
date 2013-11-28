let mapleader=","
set nocompatible

if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'
NeoBundle 'rails.vim'
NeoBundle 'kien/ctrlp.vim'

NeoBundle 'scrooloose/nerdtree'
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

NeoBundle 'scrooloose/syntastic'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'skalnik/vim-vroom'

NeoBundle 'majutsushi/tagbar'
map <Leader>rt :TagbarToggle<CR>

NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'ddollar/nerdcommenter'

" Syntax hightlighters
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'sunaku/vim-ruby-minitest'
NeoBundle 'skwp/vim-rspec'
NeoBundle 'vim-ruby/vim-ruby'

" NeoBundle 'altercation/vim-colors-solarized'
" colorscheme solarized
NeoBundle 'endel/vim-github-colorscheme'
colorscheme github
set background=dark
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_bold=0

filetype plugin indent on

NeoBundleCheck

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
set colorcolumn=80
set incsearch

nnoremap <S-j> <C-j>
nnoremap <S-k> <C-k>
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

inoremap jj <ESC>
nnoremap ; :

au FocusLost * :wa
autocmd BufEnter * lcd %:p:h

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:crtlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
