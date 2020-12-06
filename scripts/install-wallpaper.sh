#!/bin/sh
while [ ! -f "$HOME/.config/wallpaper.png" ]
do
    newWallpaper=$(find $HOME -not -path '*/\.*' -type f \( -name '*.jpg' -or -name '*.png' \) | fzf --height 50% --header "Select your wallpaper")
    if [ -f "$newWallpaper" ]; then
        sh "$DOTFILES/bin/.wal"
        break
    fi
done