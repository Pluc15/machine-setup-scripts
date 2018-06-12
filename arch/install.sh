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
	mkdir -p `dirname $2`
	rm $2
	ln -fs $1 $2
}

function sudosafeln {
	sudo mkdir -p `dirname $2`
	sudo rm $2
	sudo ln -fs $1 $2
}

sudosafeln $DOTFILES/arch/pacman/mirrorlist /etc/pacman.d/mirrorlist

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
ttf-font-hack

install_aur packer

packer -Syuq --noconfirm
packer -S --noconfirm \
google-chrome \
spotify \
visual-studio-code-bin \
x2vnc-no-xinerama \
slack-desktop \
fisherman \
python-pywal \
openoffice \
discord \
dotnet-sdk

fish -c fisher z fzf
fish -c fisher up

# Configs
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

# Global scripts
safeln $DOTFILES/linux/scripts/git-tree.sh $HOME/.scripts/git-tree.sh
safeln $DOTFILES/linux/scripts/kb-layout-toggle.sh $HOME/.scripts/kb-layout-toggle.sh
safeln $DOTFILES/linux/scripts/lock.sh $HOME/.scripts/lock.sh
safeln $DOTFILES/linux/scripts/power-menu.sh $HOME/.scripts/power-menu.sh
safeln $DOTFILES/linux/scripts/rofi-launch-lpass.fish $HOME/.scripts/rofi-launch-lpass.fish
safeln $DOTFILES/linux/scripts/rofi-launch.sh $HOME/.scripts/rofi-launch.sh
safeln $DOTFILES/linux/scripts/rofi-modi-lpass.sh $HOME/.scripts/rofi-modi-lpass.sh
safeln $DOTFILES/linux/scripts/spotify-current-song.sh $HOME/.scripts/spotify-current-song.sh
safeln $DOTFILES/linux/scripts/wallpaper.sh $HOME/.scripts/wallpaper.sh
