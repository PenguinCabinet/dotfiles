:set number relativenumber
command! Tex tabe | Explore
set noswapfile
set laststatus=2

function! CharCol()
  return strchars(getline('.')[0 : col('.') - 2]) + 1
endfunctio
set statusline=%<%f\ %h%m%r%=%{strchars(getline('.'))}文字\ %l:%{CharCol()}

nnoremap j gj
nnoremap k gk

command! Erc tabe ~/.vimrc

