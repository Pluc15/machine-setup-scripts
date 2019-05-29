#!/bin/sh
$DOTFILES/bin/.load-xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

exec dbus-launch --sh-syntax --exit-with-session i3 --shmlog-size 0