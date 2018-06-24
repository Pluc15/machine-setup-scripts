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
sudosafeln $DOTFILES/arch/pacman/mirrorlist /etc/pacman.d/mirrorlist

echoStep "Linking configuraion files"
safeln $DOTFILES/linux/fish/config.fish $HOME/.config/fish/config.fish
safeln $DOTFILES/linux/i3/config $HOME/.config/i3/config
safeln $DOTFILES/linux/i3/i3status.config $HOME/.config/i3status/config
safeln $DOTFILES/linux/dunst/dunstrc $HOME/.config/dunst/dunstrc
safeln $DOTFILES/linux/xorg/.Xresources $HOME/.Xresources
safeln $DOTFILES/linux/xorg/.xinitrc $HOME/.xinitrc
safeln $DOTFILES/linux/xorg/.xserverrc $HOME/.xserverrc
safeln $DOTFILES/linux/xorg/xorg.conf $HOME/.config/xorg.conf
safeln $DOTFILES/linux/compton/compton.conf $HOME/.config/compton.conf
safeln $DOTFILES/git/.gitconfig $HOME/.gitconfig

echoStep "Linking scripts"
safeln $DOTFILES/linux/scripts/git-tree $HOME/.scripts/git-tree
safeln $DOTFILES/linux/scripts/kb-layout-toggle $HOME/.scripts/kb-layout-toggle
safeln $DOTFILES/linux/scripts/lock $HOME/.scripts/lock
safeln $DOTFILES/linux/scripts/power-menu $HOME/.scripts/power-menu
safeln $DOTFILES/linux/scripts/rofi-launch $HOME/.scripts/rofi-launch
safeln $DOTFILES/linux/scripts/spotify-current-song $HOME/.scripts/spotify-current-song
safeln $DOTFILES/linux/scripts/wallpaper $HOME/.scripts/wallpaper

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

if [ ! -d "$HOME/.aur/packer" ]
then
	echoStep "Installing packer"
	git clone https://aur.archlinux.org/packer.git $HOME/.aur/$1
	pushd $HOME/.aur/packer
else
	echoStep "Updating packer"
	pushd $HOME/.aur/packer
	git pull
fi
makepkg -si --noconfirm --needed
popd

echoStep "Updating AUR packages"
packer -Syuq --noconfirm
echoStep "Installing new AUR packages"
packer -S --noconfirm \
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
