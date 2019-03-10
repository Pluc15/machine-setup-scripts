#!/bin/sh

DOTFILES=`dirname $0`/..
DOTFILES=`realpath $DOTFILES`

. $DOTFILES/bash/functions/install_helpers.sh

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install \
i3 \
xserver-xorg \
xinit \
chromium-browser

safeln $DOTFILES/htpc/i3.config $HOME/.config/i3/config
safeln $DOTFILES/htpc/.xinitrc $HOME/.xinitrc
safeln $DOTFILES/git/.gitconfig $HOME/.gitconfig
