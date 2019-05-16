#!/bin/sh
echo "## Everything in this file will be erased next time you run the dotfiles installer" > "$HOME/.config/dotfiles_profile"
echo "export DOTFILES=$DOTFILES" >> "$HOME/.config/dotfiles_profile"
echo "PATH=\$PATH:$DOTFILES/bin" >> "$HOME/.config/dotfiles_profile"

echo "## Everything in this file will be erased next time you run the dotfiles installer" > "$HOME/.config/dotfiles_xresources"
echo "*.monitor1: $($DOTFILES/bin/.monitor 0)" >> "$HOME/.config/dotfiles_xresources"
echo "*.monitor2: $($DOTFILES/bin/.monitor 1)" >> "$HOME/.config/dotfiles_xresources"
echo "*.monitor3: $($DOTFILES/bin/.monitor 2)" >> "$HOME/.config/dotfiles_xresources"
