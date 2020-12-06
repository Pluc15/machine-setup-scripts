#!/bin/sh
set -e

######### TODO
# git fetch and check if HEAD == origin/master
# systemctl enable snapd.service
# sudo snap install storage-explorer

export DOTFILES=`dirname $0`
export DOTFILES=`realpath $DOTFILES`

echoStep() {
    echo ""
    echo -e "== $1 =="
}

echoStep "Installing / updating yay"
sh "$DOTFILES/scripts/install-yay.sh"

echoStep "Installing / updating pacman packages"
sh "$DOTFILES/scripts/install-packages.sh"


echoStep "Installing dotnet tools"
sh "$DOTFILES/scripts/install-dotnet-tools.sh"

echoStep "Installing npm dependencies"
npm i

echoStep "Linking configuraion files"
npm run link

echoStep "Create profile script for dotfiles environment variables"
sh "$DOTFILES/scripts/install-global-env-vars.sh"

echoStep "Checking for wallpaper"
sh "$DOTFILES/scripts/install-wallpaper.sh"

echoStep "Checking for default screen layout"
sh "$DOTFILES/scripts/install-default-screen-layout.sh"

echoStep "Running pacman packages audit -- PLEASE READ THE OUTPUT"
arch-audit

echoStep "Done!"
echo "==> You should restart your X session"
