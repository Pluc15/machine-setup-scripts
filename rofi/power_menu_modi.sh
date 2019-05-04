#!/bin/sh

if [ ! -z "$@" ]
then
    case "$@" in
    Lock)
        i3exit lock
        ;;
    Logout)
        i3exit logout
        ;;
    Reboot)
        i3exit reboot
        ;;
    Shutdown)
        i3exit shutdown
        ;;
    Suspend)
        i3exit suspend
        ;;
    "Switch User")
        i3exit switch_user
        ;;
    esac
    exit
fi

echo "Lock"
echo "Logout"
echo "Reboot"
echo "Shutdown"
echo "Suspend"
echo "Switch User"