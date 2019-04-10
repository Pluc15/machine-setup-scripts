# Arch installation notes

## Pre chroot

- Setup insternet (eth interface up + dhcpd)
- Get pacman mirrorlist from this git

## Post chroot

- Install sudoer
- Add user (with home folder)
- Add new user to sudoers
- Remove root login

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

# Notes

## Installing EFI bootloader

`efibootmgr --disk /dev/nvme0n1 --part 1 --create --label "Arch Linux" --loader /vmlinuz-linux --unicode 'root=/dev/nvme0n1p2 rw initrd=/intel-ucode.img initrd=/initramfs-linux.img' --verbose`

# TODOs

- Theme dunst, gtk, qt, i3blocks (https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications)
- Configure ranger
- Try to improve screen tearing https://wiki.archlinux.org/index.php/intel_graphics#Tearing
- Fix touchpad tap click
