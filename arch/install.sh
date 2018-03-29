#!/bin/sh
DOTFILES=`pwd`/`dirname $0`/..
DOTFILES=`realpath $DOTFILES`

source $DOTFILES/arch/install.fn.sh

sudosafeln $DOTFILES/arch/pacman/mirrorlist /etc/pacman.d/mirrorlist

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
mariadb

install_aur packer

sudo packer -Sq --needed --noconfirm \
google-chrome \
spotify \
visual-studio-code \
x2vnc-no-xinerama \
ttf-font-awesome \
slack-desktop \
fisherman \
polybar-git \
python-pywal \
openoffice \
discord \
dotnet-sdk

fish -c fisher z fzf
fish -c fisher up

# Configs
safeln $DOTFILES/linux/fish/config.fish $HOME/.config/fish/config.fish
safeln $DOTFILES/linux/i3/config $HOME/.config/i3/config
safeln $DOTFILES/linux/dunst/dunstrc $HOME/.config/dunst/dunstrc
safeln $DOTFILES/linux/xorg/.Xresources $HOME/.Xresources
safeln $DOTFILES/linux/xorg/.xinitrc $HOME/.xinitrc
safeln $DOTFILES/linux/xorg/.xserverrc $HOME/.xserverrc
safeln $DOTFILES/linux/xorg/xorg.conf $HOME/.config/xorg.conf
safeln $DOTFILES/linux/compton/compton.conf $HOME/.config/compton.conf
safeln $DOTFILES/linux/polybar/config $HOME/.config/polybar/config
safeln $DOTFILES/cross/vscode/settings.json $HOME/.config/Code/User/settings.json
safeln $DOTFILES/git/.gitconfig $HOME/.gitconfig

# Global scripts
safeln $DOTFILES/linux/scripts/git-tree.sh $HOME/.scripts/git-tree.sh
safeln $DOTFILES/linux/scripts/kb-layout-toggle.sh $HOME/.scripts/kb-layout-toggle.sh
safeln $DOTFILES/linux/scripts/lock.sh $HOME/.scripts/lock.sh
safeln $DOTFILES/linux/scripts/polybar-launch.sh $HOME/.scripts/polybar-launch.sh
safeln $DOTFILES/linux/scripts/power-menu.sh $HOME/.scripts/power-menu.sh
safeln $DOTFILES/linux/scripts/rofi-launch-lpass.fish $HOME/.scripts/rofi-launch-lpass.fish
safeln $DOTFILES/linux/scripts/rofi-launch.sh $HOME/.scripts/rofi-launch.sh
safeln $DOTFILES/linux/scripts/rofi-modi-lpass.sh $HOME/.scripts/rofi-modi-lpass.sh
safeln $DOTFILES/linux/scripts/spotify-current-song.sh $HOME/.scripts/spotify-current-song.sh
safeln $DOTFILES/linux/scripts/wallpaper.sh $HOME/.scripts/wallpaper.sh
