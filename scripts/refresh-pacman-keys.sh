#!/bin/sh
sudo pacman-key --refresh-keys
pacman -Sy archlinux-keyring && pacman -Su