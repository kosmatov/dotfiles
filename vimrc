let mapleader=","
set nocompatible

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
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
" NeoBundle 'kana/vim-textobj-user'
" NeoBundle 'nelstrom/vim-textobj-rubyblock'

" Syntax hightlighters & lang support
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-rails'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'sunaku/vim-ruby-minitest'
NeoBundle 'skwp/vim-rspec'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'fatih/vim-go'
let g:go_disable_autoinstall = 1
syntax enable

" NeoBundle 'altercation/vim-colors-solarized'
" colorscheme solarized
" let g:solarized_termcolors=16
" let g:solarized_termtrans=1
" let g:solarized_bold=0

" NeoBundle 'tomasr/molokai'
" colorscheme molokai

set background=dark

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
set nowrap
set colorcolumn=80
set incsearch

nnoremap <S-j> <C-j>
nnoremap <S-k> <C-k>
nnoremap <C-m> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>j
nnoremap <C-l> <C-w>k

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap ; :
" navigation for colemak
nnoremap l k
nnoremap m l
nnoremap k j
vnoremap l k
vnoremap m l
vnoremap k j

au FocusLost * :wa
autocmd BufEnter * lcd %:p:h

" if executable('ag')
"   set grepprg=ag\ --nogroup\ --nocolor
"   let g:crtlp_user_command = 'ag %s -l --nocolor -g ""'
"   let g:ctrlp_use_caching = 0
" endif

" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
