echo "Make directories..."
mkdir ~/Downloads
mkdir ~/Documents
mkdir ~/Pictures

sudo apt update -y
sudo apt upgrade -y

echo "Install Window System..."
sudo apt install lightdm awesome -y
echo "exec awesome" > ~/.xinitrc
echo "startx" >> ~/.bash_profile

echo "Install basic softwears..."
sudo apt install wget gpg -y

echo "Install softwears..."
#Install vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
sudo apt update -y
sudo apt install vivaldi-stable -y

#Install VS Code
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
 sudo apt install code -y

#Install Pipewire
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream -y
sudo add-apt-repository ppa:pipewire-debian/wireplumber-upstream -y
sudo apt update -y
sudo apt install gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,bin,jack,alsa,v4l2,libcamera,locales,tests}} \
libpipewire-module-x11-bell \
wireplumber{,-doc} gir1.2-wp-0.4 libwireplumber-0.4-{0,dev}  -y
sudo apt install pavucontrol pulseaudio-utils -y

sudo apt autoremove -y

echo "Link config files..."
for e in .??*; do
    [ "$e" = ".git" ] && continue
    [ "$e" = "install.sh" ] && continue
    rm -r "$HOME/$e"
    ln -s "$(pwd)/$e" "$HOME/$e"
done

cd config
for e in ??*; do
    [ "$e" = ".git" ] && continue
    [ "$e" = "install.sh" ] && continue
    rm -r "$HOME/.config/$e"
    ln -s "$(pwd)/$e" "$HOME/.config/$e"
done
cd ..

echo "Complete!!"