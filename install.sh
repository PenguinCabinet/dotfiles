bash ./init_config.sh

apt update -y
apt upgrade -y


bash ./install_cui.sh
bash ./install_ws.sh
bash ./install_gui.sh

apt autoremove -y

chsh -s /usr/bin/fish $SUDO_USER

bash ./copy_config.sh

echo "Complete!!"

#reboot