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
    rofi \
    pavucontrol \
    pulseaudio \
    redshift \
    tk \
    ttf-fira-code

echoStep "Linking configuraion files"
ln -fs "$DOTFILES/i3.config" "$HOME/.config/i3/config"
ln -fs "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DOTFILES/rofi.config" "$HOME/.config/rofi/config"
ln -fs "$DOTFILES/vscode.settings.json" "$HOME/.config/Code - OSS/User/settings.json"
ln -fs "$DOTFILES/.profile" "$HOME/.profile"
ln -fs "$DOTFILES/.bashrc" "$HOME/.bashrc"
ln -fs "$DOTFILES/compton.config" "$HOME/.config/compton.config"

echoStep "Linking scripts"
ln -fs "$DOTFILES/shell_scripts/*" "$HOME/.scripts/"