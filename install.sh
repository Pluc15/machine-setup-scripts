#!/bin/sh
export DOTFILES=`dirname $0`/..
export DOTFILES=`realpath $DOTFILES`

echoStep() {
	echo -e "== $1 =="
}

echoStep "Updating pacman packages"
sudo pacman -Syu

echoStep "Installing pacman packages"
sudo pacman -S --needed \
    arc-gtk-theme \
    code \
    compton \
    compton-conf \
    dunst \
    git \
    google-chrome \
    lastpass-cli \
    pamixer \
    papirus-icon-theme \
    pavucontrol \
    pulseaudio \
    python-pywal \
    redshift \
    rofi \
    rxvt-unicode \
    tk \
    ttf-fira-code \
    ttf-font-awesome \
    x11vnc \
    xcursor-breeze \
    scrot \

echoStep "Creating all the folders we will need"
mkdir -p "~/.config/Code - OSS/User"
mkdir -p "~/.config/dunst"
mkdir -p "~/.config/gtk-3.0"
mkdir -p "~/.config/i3"
mkdir -p "~/.config/profile.d"
mkdir -p "~/.config/wal/templates"
mkdir -p "~/.config/rofi"
mkdir -p "~/.config/Xresources.d"

echoStep "Linking configuraion files"
ln -fs "$DOTFILES/configs/.gitconfig"                                    "~/.gitconfig"
ln -fs "$DOTFILES/configs/.gtkrc-2.0"                                    "~/.gtkrc-2.0"
ln -fs "$DOTFILES/configs/.profile"                                      "~/.profile"
ln -fs "$DOTFILES/configs/.xinitrc"                                      "~/.xinitrc"
ln -fs "$DOTFILES/configs/.config/Code - OSS/User/settings.json"         "~/.config/Code - OSS/User/settings.json"
ln -fs "$DOTFILES/configs/.config/compton.conf"                          "~/.config/compton.conf"
ln -fs "$DOTFILES/configs/.config/dunst/dunstrc"                         "~/.config/dunst/dunstrc"
ln -fs "$DOTFILES/configs/.config/gtk-3.0/gtk.css"                       "~/.config/gtk-3.0/gtk.css"
ln -fs "$DOTFILES/configs/.config/gtk-3.0/settings.ini"                  "~/.config/gtk-3.0/settings.ini"
ln -fs "$DOTFILES/configs/.config/i3/config"                             "~/.config/i3/config"
ln -fs "$DOTFILES/configs/.config/redshift.conf"                         "~/.config/redshift.conf"
ln -fs "$DOTFILES/configs/.config/rofi/config"                           "~/.config/rofi/config"
ln -fs "$DOTFILES/configs/.config/rofi/rofi-my-dark-theme.rasi"          "~/.config/rofi/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/.config/wal/templates/dunstrc"                 "~/.config/wal/templates/dunstrc"
ln -fs "$DOTFILES/configs/.config/wal/templates/rofi-my-dark-theme.rasi" "~/.config/wal/templates/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/.config/wal/templates/xresources-00-base"      "~/.config/wal/templates/xresources-00-base"
ln -fs "$DOTFILES/configs/.config/Xresources.d/00-base"                  "~/.config/Xresources.d/00-base"

echoStep "Configure"
echo '#!/bin/sh'                                                                          >  "~/.config/profile.d/00-dotfiles-generated.sh"
echo "## Everything in this file will be erased next time you run the dotfiles installer" >> "~/.config/profile.d/00-dotfiles-generated.sh"
echo "export DOTFILES=$DOTFILES"                                                          >> "~/.config/profile.d/00-dotfiles-generated.sh"
echo "PATH=\$PATH:$DOTFILES/bin"                                                          >> "~/.config/profile.d/00-dotfiles-generated.sh"

echoStep "Done!"
echo "==> You should restart your X session"