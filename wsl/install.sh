#!/bin/sh
if [ -z $1 ]
then
	echo "Usage: sh install.sh \"/shell/default/folder/path\""
	exit 1
fi

DOTFILES=`dirname $0`
DOTFILES=`realpath $DOTFILES/..`

echoStep() {
	echo -e "== $1 =="
}


echoStep "Updating / installing packages"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install \
	lastpass-cli \
	openssh

echoStep "Linking configuraion files"
ln -fs "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
