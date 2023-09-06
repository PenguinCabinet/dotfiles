set -xg LC_ALL ja_JP.UTF-8
set -xg LANG ja_JP.UTF-8

alias cpcb "xsel --clipboard --input"

set -xg GTK_IM_MODULE fcitx
set -xg XMODIFIERS @im=fcitx
set -xg QT_IM_MODULE fcitx

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

startx
