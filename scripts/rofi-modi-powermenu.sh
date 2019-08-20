#!/bin/sh

if [ ! -z "$@" ]
then
    case "$@" in
    Lock)
        i3lock
        ;;
    Logout)
        i3-msg exit
        ;;
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
    Suspend)
        systemctl suspend
        ;;
    Hibernate)
        systemctl hibernate
        ;;
    esac
    exit
fi

echo "Lock"
echo "Logout"
echo "Reboot"
echo "Shutdown"
echo "Suspend"
echo "Hibernate"