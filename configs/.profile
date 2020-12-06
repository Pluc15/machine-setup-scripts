#!/bin/sh
if test -d ~/.config/profile.d/; then
    for profile in ~/.config/profile.d/*.sh; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi

#if test -d /etc/profile.d/; then
#    for profile in /etc/profile.d/*.sh; do
#        test -r "$profile" && . "$profile"
#    done
#    unset profile
#fi
