# Installing

- `sudo nano /etc/pacman.conf` Enable multilib repo
- Clone this git
- `sh install.sh`

# Documentation

## Updating your machine and dotfiles

`.update`

## Themes

### Generating a new theme

`.theme-generator theme-name path/to/background`

### Changing the active theme

`.theme-selector theme-name`

# TODOs

- Shell
  - Change prompt
- Better Super-Tab with window preview
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
- Fix x11vnc startup: It easily dies when connection dies + add the systray gui
- If yay is not instead, install manually
