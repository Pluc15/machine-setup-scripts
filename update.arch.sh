#!/bin/sh
sudo pacman -Syuq --noconfirm --needed

fish -c fisher up

pushd $HOME/.aur/i3-gaps
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/google-chrome
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/spotify
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/visual-studio-code
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/x2vnc-no-xinerama
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/ttf-font-awesome
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/discord
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/slack-desktop
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/fisherman
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/skypeforlinux-bin
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/polybar-git
git pull
makepkg -si --noconfirm --needed
popd

pushd $HOME/.aur/python-pywal
git pull
makepkg -si --noconfirm --needed
popd
