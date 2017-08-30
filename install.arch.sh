#!/bin/sh

sudo rm /etc/pacman.d/mirrorlist
sudo ln -fs $HOME/.dotfiles/pacman/mirrorlist /etc/pacman.d/mirrorlist

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
openssh

fish -c fisher z fzf

git clone https://aur.archlinux.org/i3-gaps.git $HOME/.aur/i3-gaps
pushd $HOME/.aur/i3-gaps
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/google-chrome.git $HOME/.aur/google-chrome
pushd $HOME/.aur/google-chrome
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/spotify.git $HOME/.aur/spotify
pushd $HOME/.aur/spotify
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/visual-studio-code.git $HOME/.aur/visual-studio-code
pushd $HOME/.aur/visual-studio-code
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/x2vnc-no-xinerama.git $HOME/.aur/x2vnc-no-xinerama
pushd $HOME/.aur/x2vnc-no-xinerama
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/ttf-font-awesome.git $HOME/.aur/ttf-font-awesome
pushd $HOME/.aur/ttf-font-awesome
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/discord.git $HOME/.aur/discord
pushd $HOME/.aur/discord
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/slack-desktop.git $HOME/.aur/slack-desktop
pushd $HOME/.aur/slack-desktop
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/fisherman.git $HOME/.aur/fisherman
pushd $HOME/.aur/fisherman
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/pkgbase/skypeforlinux-bin $HOME/.aur/skypeforlinux-bin
pushd $HOME/.aur/skypeforlinux-bin
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/polybar-git.git $HOME/.aur/polybar-git
pushd $HOME/.aur/polybar-git
makepkg -si --noconfirm
popd

git clone https://aur.archlinux.org/python-pywal.git $HOME/.aur/python-pywal
pushd $HOME/.aur/python-pywal
makepkg -si --noconfirm
popd

mkdir -p $HOME/.config/i3
mkdir -p $HOME/.config/dunst

ln -fs $HOME/.dotfiles/i3/config $HOME/.config/i3/config
ln -fs $HOME/.dotfiles/dunst/dunstrc $HOME/.config/dunst/dunstrc
ln -fs $HOME/.dotfiles/xorg/.Xresources $HOME/.Xresources
ln -fs $HOME/.dotfiles/xorg/.xinitrc $HOME/.xinitrc
ln -fs $HOME/.dotfiles/xorg/.xserverrc $HOME/.xserverrc
ln -fs $HOME/.dotfiles/fish/config.fish $HOME/.config/fish/config.fish
ln -fs $HOME/.dotfiles/compton/compton.conf $HOME/.config/compton.conf
ln -fs $HOME/.dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json
