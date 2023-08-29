set -xg LC_ALL ja_JP.UTF-8
set -xg LANG ja_JP.UTF-8

alias cpcb "xsel --clipboard --input"

set -xg GTK_IM_MODULE fcitx
set -xg XMODIFIERS @im=fcitx
set -xg QT_IM_MODULE fcitx

sway
