# Installing

- `sudo nano /etc/pacman.conf` Enable multilib repo
- Clone this git
- `sh install.sh`

# TODOs

- Change shell prompt
- Better Super-Tab with window preview
- Display unread mail in i3bar
- Display unread notification in i3bar
- Fix hardcoded `/home/pluc/`
- Learn how auto mounting usb devices works `https://wiki.archlinux.org/index.php/Udev#Udisks` and set it up in my dotfiles
- Learn how `xdg` works and make a config for my dotfiles
- Fit `sudo sensors-detect` somewhere so the sensors cli outputs the gpu temps
- Generate initial locale (Super+Space) so i3status isnt broken until the first time you use the feature and make it configurable
- Only send apps started from startup.sh to the scratchpad instead of all subsequent runs
- Remove my email from everywhere
- Fix x11vnc startup: It easily dies when connection dies + add the systray gui
