:set number relativenumber
command! Tex tabe | Explore
set noswapfile
set laststatus=2
set statusline=%<%f\ %h%m%r%=%{strchars(getline('.'))}文字\ %l:%c
command! Erc tabe ~/.vimrc

