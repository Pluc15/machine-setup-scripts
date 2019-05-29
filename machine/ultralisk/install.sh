#!/bin/sh

if [[ -z $DOTFILES ]]
then
	echo "Run the main installer first and relog"
fi

echoStep() {
	echo -e "== $1 =="
}

ln -fs "$DOTFILES/machine/ultralisk/profile.ultralisk.sh" "$HOME/.config/profile.d/ultralisk.sh"
. $HOME/.profile
.configure
.reload