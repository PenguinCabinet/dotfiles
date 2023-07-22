apt update -y
apt upgrade -y
sed -i "s/#\$nrconf{restart} = 'i';/\$nrconf{restart} = 'a';/g" /etc/needrestart/needrestart.conf

bash ./install_cui.sh
bash ./install_ws.sh
bash ./install_gui.sh

apt autoremove -y

chsh -s /usr/bin/fish

bash ./copy_config.sh

echo "Complete!!"

#reboot