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

safeln() {
	echo `dirname $2`
	echo "$1"
	echo "$2"
	echo "---"
	#mkdir -p `dirname $2`
	rm "$2"
	ln -fs "$1" "$2"
}

echoStep "Updating package repositories"
sudo apt-get update

echoStep "Upgrading packages"
sudo apt-get upgrade

echoStep "Installing new packages"
sudo apt-get install \
	lastpass-cli \
	openssh

echoStep "Linking configuraion files"
safeln $DOTFILES/git/.gitconfig $HOME/.gitconfig
