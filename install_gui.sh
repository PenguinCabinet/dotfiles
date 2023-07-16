
#Install xterm
sudo apt install xterm -y

#Install alacritty
sudo apt install --no-install-recommends cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://github.com/alacritty/alacritty.git
cd alacritty
rustup override set stable
rustup update stable
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
#sudo desktop-file-install extra/linux/Alacritty.desktop
#sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
echo "source $(pwd)/extra/completions/alacritty.fish" >> .config/fish/config.fish
cd ..
rm -rf alacritty


echo "Install softwears..."
#Install vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add - -y
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main' -y
sudo apt update -y
sudo apt install --no-install-recommends vivaldi-stable -y

#Install VS Code
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
 sudo apt install --no-install-recommends code -y

#Install Pipewire
sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream -y
sudo add-apt-repository ppa:pipewire-debian/wireplumber-upstream -y
sudo apt update -y
sudo apt install --no-install-recommends gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,bin,jack,alsa,v4l2,libcamera,locales,tests}} \
libpipewire-module-x11-bell \
wireplumber{,-doc} gir1.2-wp-0.4 libwireplumber-0.4-{0,dev}  -y
sudo apt install --no-install-recommends pavucontrol pulseaudio-utils -y
