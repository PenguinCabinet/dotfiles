:set number relativenumber
command! Tex tabe | Explore
set noswapfile
set laststatus=2

function! CharCol()
  return strchars(getline('.')[0 : col('.') - 2]) + 1
endfunctio
function! VisualCharCount() abort
  if mode() !~# 'v'
    return ''
  endif

  let [ls, cs] = [line('v'), col('v')]
  let [le, ce] = [line('.'), col('.')]

  " 範囲の正規化
  if ls > le || (ls == le && cs > ce)
    let [ls, le] = [le, ls]
    let [cs, ce] = [ce, cs]
  endif

  let lines = getline(ls, le)
  let total = 0

  for i in range(len(lines))
    if i == 0 && i == len(lines)-1
      let total += strchars(strpart(lines[i], cs-1, ce-cs+1))
    elseif i == 0
      let total += strchars(strpart(lines[i], cs-1))
    elseif i == len(lines)-1
      let total += strchars(strpart(lines[i], 0, ce-1))
    else
      let total += strchars(lines[i])
    endif
  endfor

  return printf(' 選択%d文字', total)
endfunction

set statusline=%<%f\ %h%m%r%=%{strchars(getline('.'))}文字\ %l:%{CharCol()}

set statusline+=%{VisualCharCount()}


" ノーマルモード
nnoremap <Down> gj
nnoremap <Up>   gk
nnoremap j gj
nnoremap k gk

" ビジュアルモード
vnoremap <Down> gj
vnoremap <Up>   gk
vnoremap j gj
vnoremap k gk

" オペレータ待機モード（d, y などの後）
onoremap <Down> gj
onoremap <Up>   gk
onoremap j gj
onoremap k gk

" 挿入モード
inoremap <Down> <C-o>gj
inoremap <Up>   <C-o>gk
inoremap j gj
inoremap k gk

" コマンドラインモード（/ や : の入力中）
cnoremap <Down> <Down>
cnoremap <Up>   <Up>

" vimがclipboardに対応している必要がある。Debianの場合、sudo apt install vim-gtk3を実行すること
set clipboard=unnamedplus

xnoremap <leader>k "zyggVG"_d"zp

command! Erc tabe ~/.vimrc
