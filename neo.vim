set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }

tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-[> <C-\><C-N>

colorscheme onedark

let g:airline_theme = 'onedark'

function! VsTe()
  vs
  te
endfunction

function! DefaultWorkspace()
  if winwidth(0) >= 160 
    te
  endif

  if winwidth(0) >= 240 | call VsTe() | endif
  vnew
endfunction

command! -register Vste call VsTe()
command! -register DefaultWorkspace call DefaultWorkspace()

au vimenter * if !argc() | call DefaultWorkspace() | endif
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif

map <C-t> :Vste<CR>
