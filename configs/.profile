#!/bin/sh
if test -d "~/.config/profile.d"
then
    for f in "~/.config/profile.d/*.sh"
    do
        test -x "$f" && . "$f"
    done
    unset f
fi
