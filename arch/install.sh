#!/bin/sh

DOTFILES=`dirname $0`/..
DOTFILES=`realpath $DOTFILES`

source $DOTFILES/bash/functions/install_helpers.sh

echoStep "Linking pacman mirror files"
sudosafeln $DOTFILES/arch/pacman_mirrorlist /etc/pacman.d/mirrorlist

echoStep "Updating official repository packages"
sudo pacman -Syuq --noconfirm --needed

echoStep "Installing new official repository packages"
sudo pacman -Sq --needed --noconfirm \
fish \
curl \
wget \
elinks \
xorg \
pulseaudio \
pavucontrol \
playerctl \
i3lock \
dunst \
freerdp \
pptpclient \
ranger \
base-devel \
git \
fzf \
feh \
redshift \
scrot \
imagemagick \
xdialog \
dialog \
python-setuptools \
rofi \
gimp \
transmission-qt \
qt4 \
thunar \
tumbler \
xorg-xrandr \
arandr \
compton \
networkmanager \
networkmanager-openvpn \
networkmanager-pptp \
network-manager-applet \
xorg \
xf86-video-intel \
xdg-utils \
xclip \
vlc \
rxvt-unicode \
gnome-keyring \
fzf \
cifs-utils \
openssl \
openssh \
lastpass-cli \
p7zip \
libreoffice-fresh \
x11vnc \
cmake \
make \
gcc \
libmariadbclient \
mariadb \
ttf-font-awesome \
python-pywal \
dotnet-sdk

if [ ! -d "$HOME/.aur/packer-aur" ]
then
	echoStep "Installing packer-aur"
	git clone https://aur.archlinux.org/packer-aur.git $HOME/.aur/$1
	pushd $HOME/.aur/packer-aur
else
	echoStep "Updating packer-aur"
	pushd $HOME/.aur/packer-aur
	git pull
fi
makepkg -si --noconfirm --needed
popd

echoStep "Updating AUR packages"
packer-aur -Syuq --noconfirm

echoStep "Installing new AUR packages"
packer-aur -S --noconfirm \
google-chrome \
spotify \
visual-studio-code-bin \
x2vnc-no-xinerama \
fisherman \
discord

echoStep "Updating fish plugins"
fish -c fisher up

echoStep "Installing new fish plugins"
fish -c fisher z fzf

echoStep "Linking configuraion files"
safeln $DOTFILES/i3/config $HOME/.config/i3/config
safeln $DOTFILES/i3/i3status.config $HOME/.config/i3status/config
safeln $DOTFILES/dunst/dunstrc $HOME/.config/dunst/dunstrc
safeln $DOTFILES/xorg/.Xresources $HOME/.Xresources
safeln $DOTFILES/xorg/.xinitrc $HOME/.xinitrc
safeln $DOTFILES/xorg/.xserverrc $HOME/.xserverrc
safeln $DOTFILES/xorg/xorg.conf $HOME/.config/xorg.conf
safeln $DOTFILES/compton/compton.conf $HOME/.config/compton.conf
safeln $DOTFILES/git/.gitconfig $HOME/.gitconfig

echoStep "Linking Fish profiles"
echo "set DOTFILES $DOTFILES" > $HOME/.config/fish/config.fish
echo "source $HOME/.config/fish/base.fish" >> $HOME/.config/fish/base.fish
echo "source $HOME/.config/fish/arch.fish" >> $HOME/.config/fish/arch.fish