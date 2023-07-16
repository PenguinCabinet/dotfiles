sudo apt update -y
sudo apt upgrade -y

bash ./install_cui.sh
bash ./install_ws.sh
bash ./install_gui.sh

sudo apt autoremove -y

chsh -s /usr/bin/fish

bash ./copy_config.sh

echo "Complete!!"

#reboot