#!/bin/sh
if [ ! -z $1 ]
then
    fullPath=$(readlink -f $1)
    echo $fullPath
    echo $fullPath > ~/.config/current-wallpaper
    wal -i $fullPath
elif [ -f ~/.config/current-wallpaper ]
then
    currentWallpaper=$(cat ~/.config/current-wallpaper)
    wal -i $currentWallpaper
else
    echo "No wallpaper configured"
fi