#!/bin/sh

DOTFILES=`dirname $0`/..
DOTFILES=`realpath $DOTFILES`
source $DOTFILES/bash/functions/install_helpers.sh

echoStep "Link pacman mirrorlist"
sudosafeln $DOTFILES/arch/pacman_mirrorlist /etc/pacman.d/mirrorlist

echoStep "Updating pacman packages"
sudo pacman -Syu

echoStep "Installing pacman packages"
sudo pacman -S --needed \
    acpi \
    arandr \
    base-devel \
    cifs-utils \
    compton \
    curl \
    code \
    docker \
    dos2unix \
    dotnet-sdk \
    dunst \
    elinks \
    feh \
    fish \
    freerdp \
    fzf \
    gimp \
    git \
    gtk2 \
    gtk3 \
    i3-gaps \
    i3blocks \
    imagemagick \
    lastpass-cli \
    libreoffice-fresh \
    mesa \
    mono \
    networkmanager \
    networkmanager-openvpn \
    networkmanager-pptp \
    nodejs \
    npm \
    openssh \
    openssl \
    otf-font-awesome \
    p7zip \
    pacman-contrib \
    pavucontrol \
    pulseaudio \
    qt4 \
    qt5-base \
    ranger \
    redshift \
    rofi \
    rxvt-unicode \
    scrot \
    smbclient \
    sudo \
    sysstat \
    thunar \
    tk \
    transmission-qt \
    ttf-font-awesome \
    ttf-fira-code \
    ttf-fira-mono \
    ttf-hack \
    ttf-roboto \
    tumbler \
    vlc \
    wget \
    x11vnc \
    xclip \
    xdg-user-dirs-update \
    xdg-utils \
    xorg-font-util \
    xorg-fonts-100dpi \
    xorg-fonts-75dpi \
    xorg-fonts-encodings \
    xorg-server \
    xorg-setxkbmap \
    xorg-xbacklight \
    xorg-xgamma \
    xorg-xinput \
    xorg-xprop \
    xorg-xrandr \
    xorg-xrdb \
    xorg-xrefresh \
    yarn

echoStep "Install / Update yay"
mkdir -p $HOME/.aur
pushd $HOME/.aur
if [ ! -d "yay" ]; then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
git pull
makepkg -si
popd

echoStep "Install / Update yay packages"
yay -Syu
yay -S --needed \
    i3lock-color \
    s-tui

echoStep "Linking configuraion files"
safeln $DOTFILES/i3/config $HOME/.config/i3/config
safeln $DOTFILES/i3/i3blocks.config $HOME/.config/i3blocks/config
safeln $DOTFILES/xorg/.Xresources $HOME/.Xresources
safeln $DOTFILES/xorg/.xinitrc $HOME/.xinitrc
safeln $DOTFILES/xorg/.xserverrc $HOME/.xserverrc
safeln $DOTFILES/xorg/xorg.conf $HOME/.config/xorg.conf
safeln $DOTFILES/git/.gitconfig $HOME/.gitconfig
safeln $DOTFILES/gtk/gtk3.ini $HOME/gtk-3.0/settings.ini
safeln $DOTFILES/gtk/.gtkrc-2.0 $HOME/.gtkrc-2.0
safeln $DOTFILES/dunst/dunstrc $HOME/.config/dunst/dunstrc
safeln $DOTFILES/compton/compton.conf $HOME/.config/compton.conf
safeln $DOTFILES/vscode/settings.json "$HOME/.config/Code - OSS/User/settings.json"
safeln $DOTFILES/rofi/config $HOME/.config/rofi/config

echoStep "Linking scripts"
safeln $DOTFILES/bash/scripts/kb-layout-toggle.sh $HOME/.scripts/kb-layout-toggle.sh
safeln $DOTFILES/bash/scripts/power-menu.sh $HOME/.scripts/power-menu.sh
safeln $DOTFILES/bash/scripts/lock.sh $HOME/.scripts/lock.sh

echoStep "Building fish profile"
echo "set DOTFILES $DOTFILES" > $HOME/.config/fish/config.fish
echo "source $DOTFILES/fish/base.fish" >> $HOME/.config/fish/config.fish
echo "source $DOTFILES/fish/arch.fish" >> $HOME/.config/fish/config.fish

