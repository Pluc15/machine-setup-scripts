#!/bin/sh
DOTFILES=`pwd`/`dirname $0`/..
DOTFILES=`realpath $DOTFILES`

function install_aur {
	if [ ! -d "$HOME/.aur/$1" ]
	then
  	git clone https://aur.archlinux.org/$1.git $HOME/.aur/$1
	fi
	pushd $HOME/.aur/$1
	git pull
	makepkg -si --noconfirm --needed
	popd
}

function safeln {
	sudo mkdir -p `dirname $2`
	sudo rm $2
	sudo ln -fs $1 $2
}

safeln $DOTFILES/arch/pacman/mirrorlist /etc/pacman.d/mirrorlist

sudo pacman -Syuq --noconfirm --needed
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
lastpass-cli

install_aur i3-gaps
install_aur google-chrome
install_aur spotify
install_aur visual-studio-code
install_aur x2vnc-no-xinerama
install_aur ttf-font-awesome
install_aur slack-desktop
install_aur fisherman
install_aur skypeforlinux-bin
install_aur polybar-git
install_aur python-pywal

install_aur libc++
install_aur discord

install_aur lttng-ust
install_aur dotnet-host
install_aur dotnet-runtime-2.0
install_aur dotnet
install_aur dotnet-sdk-2.0

fish -c fisher z fzf
fish -c fisher up

safeln $DOTFILES/linux/i3/config $HOME/.config/i3/config
safeln $DOTFILES/linux/dunst/dunstrc $HOME/.config/dunst/dunstrc
safeln $DOTFILES/linux/xorg/.Xresources $HOME/.Xresources
safeln $DOTFILES/linux/xorg/.xinitrc $HOME/.xinitrc
safeln $DOTFILES/linux/xorg/.xserverrc $HOME/.xserverrc
safeln $DOTFILES/linux/fish/config.fish $HOME/.config/fish/config.fish
safeln $DOTFILES/linux/compton/compton.conf $HOME/.config/compton.conf
safeln $DOTFILES/cross/vscode/settings.json $HOME/.config/Code/User/settings.json