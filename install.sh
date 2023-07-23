apt update -y
apt upgrade -y

#Don't ask me
sudo sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf
sed --in-place -e '/auth.*required.*pam_shells.so/s/required/sufficient/g' /etc/pam.d/chsh

bash ./install_cui.sh
bash ./install_ws.sh
bash ./install_gui.sh

apt autoremove -y

chsh -s /usr/bin/fish $SUDO_USER

bash ./copy_config.sh

echo "Complete!!"

#reboot