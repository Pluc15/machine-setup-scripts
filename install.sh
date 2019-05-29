#!/bin/sh
export DOTFILES=`dirname $0`/..
export DOTFILES=`realpath $DOTFILES`

echoStep() {
	echo -e "== $1 =="
}

echoStep "Updating pacman packages"
sudo pacman -Syu

echoStep "Installing pacman packages"
sudo pacman -S --needed \
    arc-gtk-theme \
    code \
    compton \
    compton-conf \
    dunst \
    git \
    google-chrome \
    lastpass-cli \
    papirus-icon-theme \
    pavucontrol \
    polybar \
    pulseaudio \
    python-pywal \
    redshift \
    rofi \
    rxvt-unicode \
    tk \
    ttf-fira-code \
    ttf-font-awesome \
    x11vnc \
    xcursor-breeze \
    scrot \

echoStep "Creating all the folders we will need"
mkdir -p "$HOME/.config/Code - OSS/User"
mkdir -p "$HOME/.config/dunst"
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.config/i3"
mkdir -p "$HOME/.config/polybar"
mkdir -p "$HOME/.config/profile.d"
mkdir -p "$HOME/.config/wal/templates"
mkdir -p "$HOME/.config/rofi"
mkdir -p "$HOME/.config/Xresources.d"

echoStep "Linking configuraion files"
ln -fs "$DOTFILES/configs/.gitconfig"                                    "$HOME/.gitconfig"
ln -fs "$DOTFILES/configs/.gtkrc-2.0"                                    "$HOME/.gtkrc-2.0"
ln -fs "$DOTFILES/configs/.profile"                                      "$HOME/.profile"
ln -fs "$DOTFILES/configs/.xinitrc"                                      "$HOME/.xinitrc"
ln -fs "$DOTFILES/configs/.config/Code - OSS/User/settings.json"         "$HOME/.config/Code - OSS/User/settings.json"
ln -fs "$DOTFILES/configs/.config/compton.conf"                          "$HOME/.config/compton.conf"
ln -fs "$DOTFILES/configs/.config/dunst/dunstrc"                         "$HOME/.config/dunst/dunstrc"
ln -fs "$DOTFILES/configs/.config/gtk-3.0/gtk.css"                       "$HOME/.config/gtk-3.0/gtk.css"
ln -fs "$DOTFILES/configs/.config/gtk-3.0/settings.ini"                  "$HOME/.config/gtk-3.0/settings.ini"
ln -fs "$DOTFILES/configs/.config/i3/config"                             "$HOME/.config/i3/config"
ln -fs "$DOTFILES/configs/.config/polybar/config"                        "$HOME/.config/polybar/config"
ln -fs "$DOTFILES/configs/.config/redshift.conf"                         "$HOME/.config/redshift.conf"
ln -fs "$DOTFILES/configs/.config/rofi/config"                           "$HOME/.config/rofi/config"
ln -fs "$DOTFILES/configs/.config/rofi/rofi-my-dark-theme.rasi"          "$HOME/.config/rofi/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/.config/wal/templates/dunstrc"                 "$HOME/.config/wal/templates/dunstrc"
ln -fs "$DOTFILES/configs/.config/wal/templates/rofi-my-dark-theme.rasi" "$HOME/.config/wal/templates/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/.config/wal/templates/xresources-00-base"      "$HOME/.config/wal/templates/xresources-00-base"
ln -fs "$DOTFILES/configs/.config/Xresources.d/00-base"                  "$HOME/.config/Xresources.d/00-base"

echoStep "Configure"
$DOTFILES/.configure

echoStep "Done!"
echo "==> You should restart your X session"