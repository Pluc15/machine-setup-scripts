#!/bin/sh
echo '#!/bin/sh'                                                                          >  "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "## Everything in this file will be erased next time you run the dotfiles installer" >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"

# Dotfiles executables
echo "export DOTFILES=$DOTFILES"                                                          >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "PATH=\$PATH:$DOTFILES/bin"                                                          >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"

# Folder for globally accessible scripts
# TODO make them available when autocompleting in SUDO
mkdir -p "$HOME/.scripts"
echo "PATH=\$PATH:$HOME/.scripts"                                                         >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"