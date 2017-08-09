#!/bin/sh
DIALOG=${DIALOG=Xdialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --clear --title "Power" \
        --no-tags \
        --menu "What do you want to do?" 12 51 4 \
        "Logout" "Logout" \
        "Reboot" "Reboot" \
        "Shutdown" "Shutdown" \
        2> $tempfile

retval=$?

choice=`cat $tempfile`

if (($retval > 0))
then
    echo "Canceled"
    exit
fi

case $choice in
    "Logout")
        i3-msg exit;;
    "Reboot")
        reboot;;
    "Shutdown")
        shutdown -t 0;;
esac