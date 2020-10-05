#!/bin/bash

## automatic installation of the basic survival kit on the ubuntu system

## Removing apt lock
sudo rm /var/lib/dpkg/lock-frontend; sudo rm /var/cache/apt/archives/lock;

## Updating repository
sudo apt update

## Download and install apt packages
sudo apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils \
tk-dev libffi-dev liblzma-dev python-openssl jq default-jdk imagemagick \
libmagickwand-dev software-properties-common apt-transport-https \
git emacs nomacs nemo zsh htop gnome-tweak-tool gnome-sushi neofetch dconf-editor \
qbittorrent chrome-gnome-shell libproxy1-plugin-networkmanager gparted \
baobab libimage-exiftool-perl net-tools aircrack-ng calibre

## Alacritty is gooooooooood!!!!
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty

## Download and install snap packages
sudo snap install vlc discord spotify telegram-desktop inkscape libreoffice

## The best editor is neither Emacs nor Vim, it's Emacs AND Vim!
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

## Create a tmp dir
mkdir /home/$USER/Downloads/tmp && cd /home/$USER/Downloads/tmp

## Downloads and install chrome
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i *.deb

## This is something really necessary
## zsh synxtax highlighting and for beautiful encoding
echo ">> Installing oh my FUCKING zsh and syntax dd"
curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sed -i 's/exec zsh -l/## exec zsh -l/g' install.sh
sh install.sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
chsh -s /bin/zsh
rm -Rf ~/Downloads/tmp

## Tmux without oh my FUCKING tmux is not a respectable tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

## Install ASDF and adding to zsh
## ASDF is very necessary, trust me
echo "Installing ASDF and adding to zsh"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"
echo . $HOME/.asdf/asdf.sh >> ~/.zshrc

## Python plugin on asdf
asdf plugin-add python

echo ">> end of the line, buddy! see you tomorrow!"
