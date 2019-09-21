# Installing

- `sudo nano /etc/pacman.conf` Enable multilib repo
- Clone this git
- `sh install.sh`

# Documentation

## Changing colors

- `.wal path/to/background`

## Git shortcuts

# Arch reminders

## Pacman

- Fully uninstall `pacman -Rsn`
- List explicitly installed packages `pacman -Qq`
- Get list of dependencies of a package `pactree -u pacman`
- Update all packages `pacman -Syu`
- Get best mirrors `rankmirrors -f 5` (from `pacman-contrib`)

## Unable services

```bash
systemctl enable <service-name>.service
```

# My Arch installation steps

- `sudo dd bs=4M if=/data/archlinux-*.iso of=/dev/sdX status=progress oflag=sync` Create bootable USB
- Boot from USB
- `ls /sys/firmware/efi/efivars` Check that this folder exists if your motherboard supports efi
- `ip link` Check for your network adapter
- `sudo systemctl enable dhcpcd` Enable DHCP client daemon
- **Note:** If Wifi, follow the arch manual
- `ping archlinux.org` Test internet
- `timedatectl set-ntp true` Set system clock
- `timedatectl status` Check system clock status
- `date` Test system clock
- `fdisk -l` Find the device you want to install arch on
- `fdisk /dev/sda` Start partitioning (see partition recommendations below)
- `mkfs.fat -F32 /dev/sda1` Format EFI partition
- `mkfs.ext4 /dev/sda2` Format root partition
- `mount /dev/sda2 /mnt` Mount the partitions
- `mount /dev/sda1 /mnt/boot` Mount the partitions
- `/etc/pacman.d/mirrorlist` Select good mirrors
- `pacstrap /mnt base` Install the base package
- `genfstab -U /mnt >> /mnt/etc/fstab` Generate the fstab mounting points
- `arch-chroot /mnt` Chroot into the new installation
- `ln -sf /usr/share/zoneinfo/Region/City /etc/localtime` Set the timezone
- `hwclock --systohc` to generate `/etc/adjtime` ([see this](https://jlk.fjfi.cvut.cz/arch/manpages/man/hwclock.8))
- Uncomment your chosen locale (ex `en_US.UTF-8 UTF-8`) and other needed locales in `/etc/locale.gen`
- `locale-gen` Generate the locales
- `echo "LANG=en_US.UTF-8" > /etc/locale.conf` Create locales configuration with the chosen locales
- `echo "myhostname" > /etc/hostname` Configure your hostname
- `nano /etc/hosts` Configure your hosts file with your new hostname (see example below)
- `passwd` Set root password
- `pacman -S intel-ucode` Install [microcode](https://wiki.archlinux.org/index.php/Microcode)
- `exit` Exit chroot
- `efibootmgr --disk /dev/sda --part 1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=PARTUUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX rw initrd=\initramfs-linux.img' --verbose` Create [EFI boot entry](https://wiki.archlinux.org/index.php/EFISTUB)
- `efibootmgr --verbose`
- `efibootmgr --bootorder XXXX,XXXX --verbose` Set boot order
- `reboot` Reboot
- `useradd pluc` Create user
- `passwd pluc` Set password
- `pacman -S sudo` Install sudo
- `nano /etc/sudoers` Add pluc to sudoers
- `passwd -l root` Remove root's password
- `exit` Exit all root shells and log as regular user

## Partitions

| Mount point | Partition | Partition type        | Suggested size          |
| ----------- | --------- | --------------------- | ----------------------- |
| /mnt/boot   | /dev/sda1 | EFI system partition  | 260–512 MiB             |
| /mnt        | /dev/sda2 | Linux x86-64 root (/) | Remainder of the device |

## /etc/hosts example

```
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

# Sources

- VSCode template (where to put which color code) extracted from https://github.com/cmschuetz/vscode-wal (I didn't want the extension)

# TODOs

- Shell
  - Change prompt
- Driver
  - Fix screen tearing
- Improve look
  - Map pywal colors to [JetBrains IDEs](https://github.com/0x6C38/intellijPywal)
  - Map pywal colors to GTK 2/3
  - Map pywal colors to QT
  - Add GTK theme reload to bin/.reload
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
- Check `i3-save-tree` if it could be useful
- Fit `sudo sensors-detect` somewhere so the sensors cli outputs the gpu temps
- Generate initial locale (Super+Space) so i3status isnt broken until the first time you use the feature
- Make the installation work with any username
- Auto configure primary monitor
