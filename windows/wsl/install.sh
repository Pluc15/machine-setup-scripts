#!/bin/sh
export DOTFILES=`dirname $0`/..
export DOTFILES=`realpath $DOTFILES`

echoStep() {
	echo -e "== $1 =="
}

echoStep "Updating pacman packages"
sudo pacman -Syu

echoStep "Linking configuraion files"
ln -fs "$DOTFILES/configs/.gitconfig"                                    "~/.gitconfig"
ln -fs "$DOTFILES/configs/.profile"                                      "~/.profile"

echoStep "Configure"
echo '#!/bin/sh'                                                                          >  "~/.config/profile.d/00-dotfiles-generated.sh"
echo "## Everything in this file will be erased next time you run the dotfiles installer" >> "~/.config/profile.d/00-dotfiles-generated.sh"
echo "export DOTFILES=$DOTFILES"                                                          >> "~/.config/profile.d/00-dotfiles-generated.sh"
echo "PATH=\$PATH:$DOTFILES/bin"                                                          >> "~/.config/profile.d/00-dotfiles-generated.sh"

echoStep "Done!"