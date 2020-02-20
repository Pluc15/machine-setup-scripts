# Installing

- `sudo nano /etc/pacman.conf` Enable multilib repo
- Clone this git
- `sh install.sh`

# Updating

- `cd $DOTFILES`
- `ggpl`
- `.update`

# Documentation

## Updating your machine (packages)

- `.update`

## Changing colors

- `.wal path/to/background`

# TODOs

- Shell
  - Change prompt
- Improve look
  - Map pywal colors to GTK 2/3
  - Map pywal colors to QT
- Better Super-Tab
- Display unread mail in i3bar
- Display unread notification in i3bar
- Fix hardcoded `/home/pluc/`
- Improve the look of notifications
- Learn how auto mounting usb devices works `https://wiki.archlinux.org/index.php/Udev#Udisks` and set it up in my dotfiles
- Learn how `xdg` works and make a config for my dotfiles
- Fit `sudo sensors-detect` somewhere so the sensors cli outputs the gpu temps
- Generate initial locale (Super+Space) so i3status isnt broken until the first time you use the feature and make it configurable
- Make the installation work with any username
- Auto configure primary monitor
- Send all apps in startup.sh to the scratchpad
- Remove my email from everywhere
- Fix second monitor stealing workspace 2
