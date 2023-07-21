
echo "Install awesome(window system)..."
sudo apt install --no-install-recommends lightdm awesome xinit xorg -y
sudo apt install --no-install-recommends fonts-ubuntu fonts-noto-cjk fonts-noto-cjk-extra ttf-ancient-fonts-symbola fonts-noto-color-emoji -y
sudo dpkg-reconfigure lightdm 
sudo apt install rofi -y
