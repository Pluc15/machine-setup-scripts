# Installing

- Clone
- `sh install.sh`

# Dotfiles How-tos

## Changing colors

- Use `wal` to generate a new scheme
- `.update-wal-colors`

# Arch How-tos

## Pacman

- Fully uninstall `pacman -Rsn`
- List explicitly installed packages `pacman -Qq`
- Get list of dependencies of a package `pactree -u pacman`
- Update all packages `pacman -Syu`
- Get best mirrors `rankmirrors -f 5` (from `pacman-contrib`)

# Additional softwares

## Official Repository

```bash
pacman -S \
  cheese \
  code \
  deluge \
  docker \
  dotnet-sdk \
  fish \
  freerdp \
  gimp \
  git \
  glances \
  gufw \
  htop \
  libreoffice \
  lm_sensors \
  lutris \
  neofetch \
  networkmanager \
  networkmanager-openvpn \
  networkmanager-pptp \
  nodejs \
  npm \
  nvidia-utils \
  obs-studio \
  openssh \
  pcmanfm \
  remmina \
  rsync \
  speedtest-cli \
  steam \
  viewnior \
  vlc \
  x11vnc \
  yarn \
  pacman-contrib
```

## AUR

- s-tui
- slack-desktop
- xboxdrv
- discord
- google-chrome

## Services to enable (systemctl enable <service>)

```bash
systemctl enable xboxdrv.service
```

# TODOs

- Shell
  - Change prompt
- Driver
  - Fix screen tearing
- Improve look
  - Map pywal colors to [JetBrains IDEs](https://github.com/0x6C38/intellijPywal)
  - Map pywal colors to Visual Sutido Code
  - Map pywal colors to GTK 2/3
  - Map pywal colors to QT
  - Add GTK theme reload to bin/.reload
- Make it work on Arch
- Health check on i3 start
- Better Super-Tab
- Display unread mail in i3bar
- Display unread notification in i3bar
- Fix hardcoded `/home/pluc/`
- Fix hardcoded `tray_output HDMI-0`
- Hotkey to change default and all audio stream to another device
- Improve the look of notifications
