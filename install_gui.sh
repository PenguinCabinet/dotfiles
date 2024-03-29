
#Install xterm
apt install xterm -y

#Install alacritty
apt install --no-install-recommends cmake pkg-config gcc libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 -y
curl https://sh.rustup.rs -sSf | sh -s -- -y
export PATH="$HOME/.cargo/bin:$PATH"
git clone https://github.com/alacritty/alacritty.git
cd alacritty
rustup override set stable
rustup update stable
cargo build --release
tic -xe alacritty,alacritty-direct extra/alacritty.info
cp target/release/alacritty /usr/local/bin
cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
#desktop-file-install extra/linux/Alacritty.desktop
#update-desktop-database
mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
echo "source $(pwd)/extra/completions/alacritty.fish" >> .config/fish/config.fish
cd ..
rm -rf alacritty


echo "Install softwears..."
#Install vivaldi
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | apt-key add -
add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main' -y
apt update -y
apt install --no-install-recommends vivaldi-stable -y
xdg-settings set default-web-browser vivaldi-stable.desktop

#Install VS Code
snap install --classic code

#Install VLC
snap install vlc

#Install nautilus
apt install nautilus -y

#Install xsel
sudo apt-get install xsel -y

#Install MEGA
#wget https://mega.nz/linux/repo/xUbuntu_22.04/amd64/megasync-xUbuntu_22.04_amd64.deb
#apt install ./megasync-xUbuntu_22.04_amd64.deb -y
#rm -f ./megasync-xUbuntu_22.04_amd64.deb

#Install Pipewire
add-apt-repository ppa:pipewire-debian/pipewire-upstream -y
add-apt-repository ppa:pipewire-debian/wireplumber-upstream -y
apt update -y
apt install --no-install-recommends gstreamer1.0-pipewire libpipewire-0.3-{0,dev,modules} libspa-0.2-{bluetooth,dev,jack,modules} pipewire{,-{audio-client-libraries,pulse,bin,jack,alsa,v4l2,libcamera,locales,tests}} \
libpipewire-module-x11-bell \
wireplumber{,-doc} gir1.2-wp-0.4 libwireplumber-0.4-{0,dev}  -y
apt install --no-install-recommends pavucontrol pulseaudio-utils -y
