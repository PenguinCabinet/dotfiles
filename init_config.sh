timedatectl set-timezone Asia/Tokyo

#Don't ask me
sed -i 's/#$nrconf{restart} = '"'"'i'"'"';/$nrconf{restart} = '"'"'a'"'"';/g' /etc/needrestart/needrestart.conf
sed --in-place -e '/auth.*required.*pam_shells.so/s/required/sufficient/g' /etc/pam.d/chsh

# git config
git config --global user.name PenguinCabinet
git config --global user.email contact@penguincabinet.com

# endable deb-src 
sed -i 's/# deb-src /deb-src /g' /etc/apt/sources.list
