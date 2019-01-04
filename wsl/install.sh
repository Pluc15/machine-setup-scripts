#!/bin/sh

DOTFILES=`dirname $0`
DOTFILES=`realpath $DOTFILES/..`
. "$DOTFILES/bash/functions/install_helpers.sh"

echoStep "Updating package repositories"
sudo apt-get update

echoStep "Upgrading packages"
sudo apt-get upgrade

echoStep "Installing new packages"
sudo apt-get install \
lastpass-cli \
fish \
openssh

echoStep "Installing fisher"
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

echoStep "Updating fish plugins"
fish -c fisher up

echoStep "Installing new fish plugins"
fish -c fisher z fzf

echoStep "Linking configuraion files"
safeln $DOTFILES/git/.gitconfig $HOME/.gitconfig

echoStep "Linking Fish profiles"
echo "set DOTFILES $DOTFILES" > $HOME/.config/fish/config.fish
echo "source $DOTFILES/fish/base.fish" >> $HOME/.config/fish/config.fish
echo "source $DOTFILES/fish/wsl.fish" >> $HOME/.config/fish/config.fish

echoStep "Adding fix for Fish autocomplete under Windows SubSystem for Linux"
sudo touch /bin/r && sudo chmod +x /bin/r
sudo touch /bin/R && sudo chmod +x /bin/R
sudo touch /bin/x86 && sudo chmod +x /bin/x86
sudo touch /bin/X86 && sudo chmod +x /bin/X86