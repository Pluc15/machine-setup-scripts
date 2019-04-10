#!/bin/sh
MENU=$(echo "Lock|Logout|Reboot|Shutdown" | \
rofi -sep "|" -dmenu -p 'System' -width 15 -hide-scrollbar -line-padding 4 -padding 20 -lines 4)
case "$MENU" in
    "Lock")
    echo "ok"
        sh ~/.scripts/lock.sh;;
    "Logout")
        i3-msg exit;;
    "Reboot")
        systemctl reboot;;
    "Shutdown")
        systemctl -i poweroff;;
esac