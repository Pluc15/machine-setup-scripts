#!/bin/sh

if [[ -z $DOTFILES ]]
then
	echo "Run the main installer first and relog"
fi

echoStep() {
	echo -e "== $1 =="
}

ln -fs "$DOTFILES/machine/ultralisk/profile.ultralisk.sh" "~/.config/profile.d/ultralisk.sh"
. ~/.profile
.configure
.reload