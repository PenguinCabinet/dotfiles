set -xg LC_ALL ja_JP.UTF-8
set -xg LANG ja_JP.UTF-8

set -xg GTK_IM_MODULE ibus
set -xg XMODIFIERS @im=ibus
set -xg QT_IM_MODULE ibus
exec ibus-daemon -dx &

startx
