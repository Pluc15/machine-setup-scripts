#!/bin/sh
if [ -d ~/.config/Xresources.d ] ; then
  for f in ~/.config/Xresources.d/?* ; do
    xrdb -merge "$f"
  done
  unset f
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

case "$1" in
  # another)
  #   exec another
  #   ;;
  *)
    #exec dbus-launch --sh-syntax --exit-with-session i3 --shmlog-size 0
    exec i3
    ;;
esac
