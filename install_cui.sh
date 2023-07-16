
echo "Install basic softwears..."
sudo apt install --no-install-recommends wget gpg fzf -y

echo "Install fish..."
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt-get update -y
sudo apt-get install fish -y
