#!/bin/sh
if test -d "~/.config/Xresources.d"
then
    for f in "~/.config/Xresources.d/?*"
    do
        test -r "$f" && xrdb -merge "$f"
    done
    unset f
fi

if test -d "/etc/X11/xinit/xinitrc.d"
then
    for f in "/etc/X11/xinit/xinitrc.d/?*.sh"
    do
        test -x "$f" && . "$f"
    done
    unset f
fi

exec dbus-launch --sh-syntax --exit-with-session i3 --shmlog-size 0
