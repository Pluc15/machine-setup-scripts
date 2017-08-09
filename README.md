# Overview

This is my complete Arch Linux setup. My goal is to have a simple and efficient environement while keeping my eyes from bleeding. I also wanted to be able to start a system from scratch and get fully setup with a single script.

| Role | App |
|-|-|
| Window Manager | i3 |
| Status Bar | polybar |
| App Launcher | rofi |
| File manager | ranger |
| Notifications | dunst |
| Shell | fish |
| Lock | i3lock w/ blur |

# Installing on Arch Linux

```bash
git clone https://github.com/Pluc15/dotfiles.git ~/.dotfiles
sh ~/.dotfiles/install.arch.sh
```

# Updating on Arch Linux

```bash
sh ~/.dotfiles/install.arch.sh
```

# Screenshot

![Screenshot](https://github.com/Pluc15/dotfiles/blob/master/assets/screenshot.png?raw=true)


# TODO

| App | To do |
|-|-|
| Arch | Make the install script executable from Arch installation |
| Xorg | Make xbacklight work |
| GTK / Qt | Automatic matching theme |
| Dunst | Styling |
| Xorg | Plug and play monitors |
| i3 | Monitor specific workspaces |
| Install | Rework install script to be re-runnable to upgrade |
| VS Code | Redo entirely and symlink |
| Ranger | Configure and symlink |