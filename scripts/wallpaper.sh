
#!/bin/sh
if [ ! -z $1 ]
then
    fullPath=$(readlink -f $1)
    echo $fullPath
    echo $fullPath > ~/.dotfiles/.state/current-wallpaper
    wal -i $fullPath
elif [ -f ~/.dotfiles/.state/current-wallpaper ]
then
    currentWallpaper=$(cat ~/.dotfiles/.state/current-wallpaper)
    wal -i $currentWallpaper
else
    echo "No wallpaper configured"
fi