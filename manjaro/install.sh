#!/bin/sh
DOTFILES=`dirname $0`/..
DOTFILES=`realpath $DOTFILES`

echoStep() {
	echo -e "== $1 =="
}

echoStep "Updating pacman packages"
sudo pacman -Syu

echoStep "Installing pacman packages"
sudo pacman -S --needed \
    code \
    compton \
    compton-conf \
    dunst \
    git \
    google-chrome \
    lastpass-cli \
    matcha-gtk-theme \
    papirus-icon-theme \
    pavucontrol \
    polybar \
    pulseaudio \
    python-pywal \
    redshift \
    rofi \
    tk \
    ttf-fira-code \
    ttf-font-awesome \
    x11vnc \
    xcursor-breeze

echoStep "Creating .profile with environment variables"
echo "export DOTFILES=$DOTFILES" > "$HOME/.profile"
echo "PATH=\$PATH:$DOTFILES/bin" >> "$HOME/.profile"

echoStep "Linking configuraion files"
ln -fs "$DOTFILES/configs/.bashrc"                                 "$HOME/.bashrc"
ln -fs "$DOTFILES/configs/.gitconfig"                              "$HOME/.gitconfig"
ln -fs "$DOTFILES/configs/.gtkrc-2.0"                              "$HOME/.gtkrc-2.0"
ln -fs "$DOTFILES/configs/.Xresources"                             "$HOME/.Xresources"
ln -fs "$DOTFILES/configs/code_settings.json"                      "$HOME/.config/Code - OSS/User/settings.json"
ln -fs "$DOTFILES/configs/compton.config"                          "$HOME/.config/compton.config"
ln -fs "$DOTFILES/configs/dunstrc"                                 "$HOME/.config/dunst/dunstrc"
ln -fs "$DOTFILES/configs/gtk-3.0_gtk.css"                         "$HOME/.config/gtk-3.0/gtk.css"
ln -fs "$DOTFILES/configs/gtk-3.0_settings.ini"                    "$HOME/.config/gtk-3.0/settings.ini"
ln -fs "$DOTFILES/configs/i3_config"                               "$HOME/.config/i3/config"
ln -fs "$DOTFILES/configs/polybar_config"                          "$HOME/.config/polybar/config"
ln -fs "$DOTFILES/configs/redshift.conf"                           "$HOME/.config/redshift.conf"
ln -fs "$DOTFILES/configs/rofi_config"                             "$HOME/.config/rofi/config"
ln -fs "$DOTFILES/configs/rofi-my-dark-theme.rasi"                 "$HOME/.config/rofi/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/pywal_templates/.Xresources"             "$HOME/.config/wal/templates/.Xresources"
ln -fs "$DOTFILES/configs/pywal_templates/dunstrc"                 "$HOME/.config/wal/templates/dunstrc"
ln -fs "$DOTFILES/configs/pywal_templates/rofi-my-dark-theme.rasi" "$HOME/.config/wal/templates/rofi-my-dark-theme.rasi"