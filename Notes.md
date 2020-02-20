# Arch

## Manjaro default settings for each flavors

This is usefull to copy some of the nice bootstrapping manjaro does

- https://gitlab.manjaro.org/profiles-and-settings/desktop-settings

## Init files info

> The xserverrc file is a shell script responsible for starting up the X server. Both startx and xinit execute ~/.xserverrc if it exists, startx will use /etc/X11/xinit/xserverrc otherwise.
> ~/.xinitrc is handy to run programs depending on X and set environment variables on X server startup. If it is present in a user's home directory, startx and xinit execute it. Otherwise startx will run the default /etc/X11/xinit/xinitrc.
> .bash_profile is executed for login shells, while .bashrc is executed for interactive non-login shells.
> When a Bourne compatible login shell starts, it first sources (parse & execute) the systemwide files like /etc/profile. Then it sources the user specific initialization file. Every user specific file resides in the particular user’s home directory which in most cases is /home/<user>/. So the file that login shell will source for user specific initialization is ~/.profile (~ is a shorthand for home directory).
> The original bourne shell was just called sh.Now, there are many Bourne compatible shells like the most famous is bash, another awesome shell is zsh. So this applies to all sh compatible shells, they first source /etc/profile, then their own systemwide config (like /etc/bashrc or /etc/zshrc) then for user specific init they source ~/.profile then they source their own login configs (~/.bash_profile or ~/.zprofile).
> https://wiki.archlinux.org/index.php/Xprofile > https://wiki.archlinux.org/index.php/Xinit#xinitrc

## Info about .bashrc .profile .xinitrc and environment variables

- https://wiki.archlinux.org/index.php/environment_variables

## Some info that may help with styling GTK

- https://wiki.archlinux.org/index.php/GTK+
- https://fishshell.com/docs/current/faq.html#faq-exported-uvar

## Manjaro default .profile

```
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
## fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/palemoon
```

## Example script that sets xprops on a windows (usefull for hotkeys that change how a window looks with compositor rules)

```bash
#!/bin/bash

local active=$(xprop -notype -root _NET_ACTIVE_WINDOW)
local status=$(xprop -notype -id ${active##*\ } _PLUC_OPAQUE)
if [ "$status" = "_PLUC_OPAQUE = 1" ]; then
    xprop -id ${active##*\ } -remove _PLUC_OPAQUE
else
    xprop -id ${active##*\ } -f _PLUC_OPAQUE 32c -set _PLUC_OPAQUE 1
fi
```

## inotify

File watcher - could be used to improve i3status reaction time

## polkit

Removed it because idk if i want to keep it
`exec --no-startup-id "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"` in i3 config

# Windows

## Adding hotkeys in powershell

```powershell
Set-PSReadlineKeyHandler -Key Ctrl+R `
    -BriefDescription "FuzzyHistory" `
    -LongDescription "FuzzyHistory" `
    -ScriptBlock {
    param($key, $arg)
    Get-FuzzyHistory
}
```

## sudo in powershell (WIP)

```powershell
function RunElevated {
    param([string]$Arguments = $args)
    $psi = New-Object System.Diagnostics.ProcessStartInfo powershell;
    $psi.Arguments = $Arguments;
    $psi.CreateNoWindow = $true;
    $psi.Verb = "runas";
    $psi.WorkingDirectory = Get-Location;
    $psi.UseShellExecute = $false;
    $psi.RedirectStandardError = $true;
    $psi.RedirectStandardInput = $true;
    $psi.RedirectStandardOutput = $true;
    [System.Diagnostics.Process]::Start($psi);
}
```

# VSCode

Lot of nice info about vscode settings that I may want to customize and bring into my dotfiles

https://code.visualstudio.com/docs/getstarted/settings

# Unify theme

Theres a whole wiki page on theme unification that I need to check.

https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications#QGtkStyle

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
