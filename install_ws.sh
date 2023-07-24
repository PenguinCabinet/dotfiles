
echo "Install awesome(window system)..."
apt install --no-install-recommends lightdm awesome xinit xorg -y
apt install --no-install-recommends fonts-ubuntu fonts-noto-cjk fonts-noto-cjk-extra ttf-ancient-fonts-symbola fonts-noto-color-emoji -y
apt install --no-install-recommends language-pack-ja -y
dpkg-reconfigure lightdm 
apt install rofi -y

apt install fcitx-mozc -y
im-config -n fcitx

usermod -a -G video $SUDO_USER
usermod -a -G cdrom $SUDO_USER
