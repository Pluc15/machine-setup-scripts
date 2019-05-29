#!/bin/sh
if test -d ~/.config/profile.d/; then
    for profile in ~/.config/profile.d/*.sh; do
        test -r "$profile" && . "$profile"
        echo "[$(date -Iseconds)] $0 - Loaded $profile" >> ~/.dotfiles_logs
    done
    unset profile
fi

echo "[$(date -Iseconds)] $0 - Done" >> ~/.dotfiles_logs
