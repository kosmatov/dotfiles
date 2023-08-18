set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
let mapleader=","
scriptencoding utf-8
set encoding=utf-8

set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
" Plug 'vim-syntastic/syntastic'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'skalnik/vim-vroom'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'
Plug 'tpope/vim-unimpaired'
Plug 'ddollar/nerdcommenter'
" Plug 'mattn/flappyvird-vim'
" Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'ahw/vim-pbcopy'
Plug 'sk1418/HowMuch'
" Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

" Plug 'nvim-treesitter/nvim-treesitter'
Plug 'mfussenegger/nvim-lint'

" Syntax hightlighters & lang support
" Plug 'sheerun/vim-polyglot'
" Plug 'pangloss/vim-javascript'
" " Plug 'tpope/vim-markdown'
" Plug 'tpope/vim-rails'
" " Plug 'slim-template/vim-slim'
" Plug 'vim-ruby/vim-ruby'
" Plug 'ecomba/vim-ruby-refactoring'
" " Plug 'szw/vim-tags'
" " " Plug 'fatih/vim-go'
" Plug 'wting/rust.vim'
" " Plug 'guns/vim-clojure-static'
" " Plug 'tpope/vim-fireplace'
" Plug 'elixir-editors/vim-elixir'

" Styles
Plug 'vim-airline/vim-airline'
" Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'endel/vim-github-colorscheme'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Plug 'altercation/solarized', {'rtp': 'vim-colors-solarized/'}

call plug#end()

syntax enable
set noshowmode
set autoread
set autowrite
au BufLeave,FocusLost * silent! wall
" au BufNewFile,BufRead *.slim setf slim

lua << EOF
local ruby = require('lint.linters.ruby')
ruby.stream = 'both'
ruby.ignore_exit_code = false

require('lint').linters_by_ft = {
  ruby = {'ruby',}
}
EOF

nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase=1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
filetype plugin indent on

" let g:go_disable_autoinstall = 1
let g:vim_pbcopy_remote_cmd = "ssh host-machine pbcopy"

map <C-n> :NERDTreeToggle \| BuffergatorClose<CR>
map <Leader>n :NERDTreeFind<CR>
map <Leader>rt :TagbarToggle<CR>

set tabstop=2
set shiftwidth=2
set softtabstop=2
set list listchars=trail:·
set smarttab
set expandtab
" set foldcolumn=1

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

" nnoremap ; :
map <Leader>p "0p

" au FocusLost * :wa
" autocmd BufEnter * lcd %:p:h

set shortmess+=A
set nohlsearch

let g:ctrlp_user_command = [".git", "cd %s && git ls-files -co --exclude-standard -- ':!:*/cassettes/*' ':!:*/node_modules/*' ':!:*public/app/js/*' ':!:*/tmp/*' ':!:*/assets/*' ':!:*/coverage/*' ':!:*/log/*'"]
let g:ctrlp_use_caching = 0

set wildignore+=*/tmp/*,*/node_modules/*,*/public/assets*,*/coverage/*,*/log/*,*/.git/*,*/cassettes/*
set title
au BufEnter * let &titlestring = getcwd()

tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-[> <C-\><C-N>
tnoremap <Esc> <C-\><C-n>

set termguicolors
set background=light
colorscheme tender
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1

hi Normal ctermbg=none guibg=none
hi NonText ctermbg=none guibg=none
hi VertSplit ctermfg=242 guifg=#666666 ctermbg=none guibg=none
hi FoldColumn ctermbg=none guibg=none
hi ColorColumn ctermbg=0
hi TabLine ctermbg=0
hi SpecialKey cterm=bold ctermfg=10 ctermbg=none guibg=none 
hi Visual guifg=none ctermfg=none guibg=#394b54 ctermbg=237 gui=bold cterm=bold
hi LineNr guifg=#6a6a6a ctermfg=242

hi DiffAdd cterm=bold ctermfg=10 ctermbg=17
hi DiffText cterm=bold ctermfg=10 ctermbg=88
hi DiffDelete cterm=bold ctermfg=10 ctermbg=17
hi DiffChange cterm=bold ctermfg=10 ctermbg=17

" au termopen * setlocal foldcolumn=0

" augroup myterm | au!
"     au termopen * if &buftype ==# 'terminal' | vert resize 80 | endif
" augroup end

function! VsTe()
  vs
  te
  " setlocal foldcolumn=0
endfunction

function! DefaultWorkspace()
  if winwidth(0) >= 160 
    te
    " setlocal foldcolumn=0
  endif

  if winwidth(0) >= 240 
    call VsTe() 
  endif

  vnew
endfunction

function! BindingPry()
  call append(line("."), "Kernel.binding.pry")
endfunction

command! -register BindingPry call BindingPry()
command! -register Vste call VsTe()
command! -register DefaultWorkspace call DefaultWorkspace()

au vimenter * if !argc() | call DefaultWorkspace() | endif
au BufWritePost <buffer> lua require('lint').try_lint()
au FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
let $GIT_EDITOR = 'nvr -cc split --remote-wait'

map <C-t> :Vste<CR>
map <C-b> :BindingPry<CR>:w<CR>
