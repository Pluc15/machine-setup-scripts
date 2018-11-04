#!/bin/sh

DOTFILES=`dirname $0`/..
DOTFILES=`realpath $DOTFILES`

function echoStep {
	echo -e "\e[33m== $1 ==\e[0m"
}

function safeln {
	mkdir -p `dirname $2`
	rm $2
	ln -fs $1 $2
}

function sudosafeln {
	sudo mkdir -p `dirname $2`
	sudo rm $2
	sudo ln -fs $1 $2
}

echoStep "Linking pacman mirror files"
sudosafeln $DOTFILES/pacman/mirrorlist /etc/pacman.d/mirrorlist

echoStep "Linking configuraion files"
safeln $DOTFILES/fish/config.fish $HOME/.config/fish/config.fish
safeln $DOTFILES/i3/config $HOME/.config/i3/config
safeln $DOTFILES/i3/i3status.config $HOME/.config/i3status/config
safeln $DOTFILES/dunst/dunstrc $HOME/.config/dunst/dunstrc
safeln $DOTFILES/xorg/.Xresources $HOME/.Xresources
safeln $DOTFILES/xorg/.xinitrc $HOME/.xinitrc
safeln $DOTFILES/xorg/.xserverrc $HOME/.xserverrc
safeln $DOTFILES/xorg/xorg.conf $HOME/.config/xorg.conf
safeln $DOTFILES/compton/compton.conf $HOME/.config/compton.conf
safeln $DOTFILES/git/.gitconfig $HOME/.gitconfig

echoStep "Linking scripts"
safeln $DOTFILES/scripts/git-tree $HOME/.scripts/git-tree
safeln $DOTFILES/scripts/kb-layout-toggle $HOME/.scripts/kb-layout-toggle
safeln $DOTFILES/scripts/lock $HOME/.scripts/lock
safeln $DOTFILES/scripts/power-menu $HOME/.scripts/power-menu
safeln $DOTFILES/scripts/rofi-launch $HOME/.scripts/rofi-launch
safeln $DOTFILES/scripts/spotify-current-song $HOME/.scripts/spotify-current-song
safeln $DOTFILES/scripts/wallpaper $HOME/.scripts/wallpaper

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

echoStep "Updating fish packages"
fish -c fisher up
echoStep "Installing new fish packages"
fish -c fisher z fzf
