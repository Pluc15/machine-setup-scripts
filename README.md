# Installing

- Clone
- `sh install.sh`

# How-Tos

## Update pacman mirrors

- `sudo pacman-mirrors --fasttrack 5 && sudo pacman -Syyu`

## Changing colors

- Use `wal` to generate a new scheme
- `.update-wal-colors`

# Stuff I usually install that isn't required for the .dotfiles to work

## Official Repository (TODO Find which one in this list is actually from the AUR)

```bash
pacman -S \
  cheese \
  code \
  deluge \
  discord \
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
  pamac-dev \
  pcmanfm \
  remmina \
  rsync \
  speedtest-cli \
  steam \
  viewnior \
  vlc \
  x11vnc \
  yarn
```

## AUR

- s-tui
- slack-desktop
- xboxdrv

## Services to enable (systemctl enable <service>)

xboxdrv.service

# TODOs

- Shell
  - Change prompt
- Driver
  - Fix screen tearing
  - Fix xbox controllers
- Improve look
  - Map pywal colors to [JetBrains IDEs](https://github.com/0x6C38/intellijPywal)
  - Map pywal colors to Visual Sutido Code
  - Map pywal colors to GTK 2/3
  - Map pywal colors to QT
  - Add GTK theme reload to bin/.reload
- Prevent pulseaudio to go over 100% with shortcuts (PA_VOLUME_UI_MAX?)
- Make it work on Arch
- Health check on i3 start
- Better Super-Tab
- Display unread mail in i3bar
- Display unread notification in i3bar
- Fix hardcoded `/home/pluc/`
- Fix hardcoded `tray_output HDMI-0`
