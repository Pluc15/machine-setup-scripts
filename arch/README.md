# Arch installation notes

## Pre chroot

* Setup insternet (eth interface up + dhcpd)
* Get pacman mirrorlist from this git

## Post chroot

* Install sudoer
* Add user (with home folder)
* Add new user to sudoers
* Remove root login

# Installing

```bash
git clone https://github.com/Pluc15/dotfiles.git ~/.dotfiles
sh ~/.dotfiles/arch/install.sh
```

# Updating

```bash
cd ~/.dotfiles
git pull
sh ~/.dotfiles/arch/install.sh
```

# TODOs

* Learn xorg config (and remake)
* Theme dunst, gtk, qt, i3blocks
* Configure ranger
* Fix background for i3lock (needs png)