#!/bin/sh
if test -d ~/.config/profile.d/; then
    for profile in ~/.config/profile.d/*.sh; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi
