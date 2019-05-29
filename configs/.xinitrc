#!/bin/sh
$DOTFILES/bin/.load-xresources

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
        echo "[$(date -Iseconds)] $0 - Loaded $f" >> ~/.dotfiles_logs
    done
    unset f
fi

exec dbus-launch --sh-syntax --exit-with-session i3 --shmlog-size 0
echo "[$(date -Iseconds)] $0 - i3 started" >> ~/.dotfiles_logs
