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

# Arch installation notes

- [skip for us keyboard] `ls /usr/share/kbd/keymaps/**/*.map.gz` List keyboard layouts
- [skip for us keyboard] `loadkeys de-latin1` Set the keyboard layout
- `ls /sys/firmware/efi/efivars` Check that this folder exists if your motherboard supports efi
- `ip link` Check for your network adapter
- `systemctl status dhcpcd.service` Check that dhcp is running
- **Note:** If Wifi, follow the arch manual
- `ping archlinux.org` Test internet
- `timedatectl set-ntp true` Set system clock
- `timedatectl status` Check system clock status
- `date` Test system clock
- `fdisk -l` Find the device you want to install arch on
- `fdisk /dev/sdX` Start partitioning (see partition recommendations below)
- `mkfs.ext4 /dev/sdX1` Format root and any other regular partitions
- `mount /dev/sdX1 /mnt` Mount the partitions
- > Create any remaining mount points (such as /mnt/efi) and mount their corresponding partitions.
- `/etc/pacman.d/mirrorlist` Select good mirrors
- `pacstrap /mnt base` Install the base package
- `genfstab -U /mnt >> /mnt/etc/fstab` Generate the fstab mounting points
- `arch-chroot /mnt` Chroot into the new installation
- `ln -sf /usr/share/zoneinfo/Region/City /etc/localtime` Set the timezone
- `hwclock --systohc` to generate `/etc/adjtime` ([see this](https://jlk.fjfi.cvut.cz/arch/manpages/man/hwclock.8))
- Uncomment your chosen locale (ex `en_US.UTF-8 UTF-8`) and other needed locales in `/etc/locale.gen`
- `locale-gen` Generate the locales
- `echo "LANG=en_US.UTF-8" > /etc/locale.conf` Create locales configuration with the chosen locales
- [skip for us keyboard] `nano /etc/vconsole.conf`
- [skip for us keyboard] Set keymap like this: `KEYMAP=de-latin1`
- `echo "myhostname" > /etc/hostname` Configure your hostname
- `nano /etc/hosts` Configure your hosts file with your new hostname (see example below)
- `passwd` Set root password
- `exit` Exit chroot
- `reboot` Reboot

## Partition recommendations

### BIOS with MBR

| Mount point | Partition | Partition type | Suggested size          |
| ----------- | --------- | -------------- | ----------------------- |
| /mnt        | /dev/sdX1 | Linux          | Remainder of the device |
| [SWAP]      | /dev/sdX2 | Linux swap     | More than 512 MiB       |

### UEFI with GPT

| Mount point           | Partition | Partition type        | Suggested size          |
| --------------------- | --------- | --------------------- | ----------------------- |
| /mnt/boot or /mnt/efi | /dev/sdX1 | EFI system partition  | 260–512 MiB             |
| /mnt                  | /dev/sdX2 | Linux x86-64 root (/) | Remainder of the device |
| [SWAP]                | /dev/sdX3 | Linux swap            | More than 512 MiB       |

## /etc/hosts example

```
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
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
- Hotkey to change default and all audio stream to another device
- Improve the look of notifications
- Learn how auto mounting usb devices works `https://wiki.archlinux.org/index.php/Udev#Udisks`
- Learn how `xdg` works and make a config for my dotfiles
