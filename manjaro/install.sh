#!/bin/sh
DOTFILES=`dirname $0`/..
DOTFILES=`realpath $DOTFILES`

if [ $DOTFILES -ne `realpath ~/.dotfiles` ]
then
    echo "Currently only support installing dotfiles in '~/.dotfiles'"
    exit
fi

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
    ttf-fira-code \
    ttf-font-awesome \
    polybar

echoStep "Linking desktop environement configuraion files"
ln -fs "$DOTFILES/.profile" "$HOME/.profile"
ln -fs "$DOTFILES/.bashrc" "$HOME/.bashrc"
ln -fs "$DOTFILES/i3.config" "$HOME/.config/i3/config"
ln -fs "$DOTFILES/polybar.config" "$HOME/.config/polybar/config"
ln -fs "$DOTFILES/compton.config" "$HOME/.config/compton.config"
ln -fs "$DOTFILES/redshift.conf" "$HOME/.config/redshift.conf"

echoStep "Linking apps configuraion files"
ln -fs "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
ln -fs "$DOTFILES/vscode.settings.json" "$HOME/.config/Code - OSS/User/settings.json"