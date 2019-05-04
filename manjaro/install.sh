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
ln -fs "$DOTFILES/.bashrc" "$HOME/.bashrc"
ln -fs "$DOTFILES/.bash_profile" "$HOME/.bash_profile"
ln -fs "$DOTFILES/.Xresources" "$HOME/.Xresources"
ln -fs "$DOTFILES/i3.config" "$HOME/.config/i3/config"
ln -fs "$DOTFILES/polybar.config" "$HOME/.config/polybar/config"
ln -fs "$DOTFILES/compton.config" "$HOME/.config/compton.config"
ln -fs "$DOTFILES/redshift.conf" "$HOME/.config/redshift.conf"
ln -fs "$DOTFILES/rofi.config" "$HOME/.config/rofi/config"
ln -fs "$DOTFILES/.gtkrc-2.0" "$HOME/.gtkrc-2.0"
ln -fs "$DOTFILES/gtk-3.0.settings.ini" "$HOME/.config/gtk-3.0/settings.ini"
ln -fs "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DOTFILES/vscode.settings.json" "$HOME/.config/Code - OSS/User/settings.json"
ln -fs "$DOTFILES/pywal_output/dunstrc" "$HOME/.config/dunst/dunstrc"
ln -fs "$DOTFILES/pywal_output/colors.Xresources" "$HOME/.config/colors.Xresources"
ln -fs "$DOTFILES/pywal_output/colors-rofi-dark.rasi" "$HOME/.config/rofi/colors-rofi-dark.rasi"
ln -fs "$DOTFILES/pywal_templates/dunstrc" "$HOME/.config/wal/templates/dunstrc"