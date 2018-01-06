#!/bin/sh
function install_aur {
	if [ ! -d "$HOME/.aur/$1" ]
	then
  	git clone https://aur.archlinux.org/$1.git $HOME/.aur/$1
	fi
	pushd $HOME/.aur/$1
	git pull
	makepkg -si --noconfirm --needed
	popd
}

function safeln {
	mkdir -p `dirname $2`
	rm $2
	ln -fs $1 $2
}

function sudosafeln {
	sudo mkdir -p `dirname $2`
	sudo rm $2
	sudo ln -fs $1 $2
}