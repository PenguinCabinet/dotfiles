
echo "Install basic softwears..."
apt install --no-install-recommends wget gpg fzf -y

echo "Install Github cli"
apt install --no-install-recommends gh -y

echo "Install fish..."
apt-add-repository ppa:fish-shell/release-3 -y
apt-get update -y
apt-get install fish -y
