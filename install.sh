#!/bin/sh
export DOTFILES=`dirname $0`
export DOTFILES=`realpath $DOTFILES`

echoStep() {
	echo -e "== $1 =="
}

echoStep "Updating pacman packages"
sudo pacman -Syyu

echoStep "Installing pacman packages"
sudo pacman -S --needed \
    arandr \
    arc-gtk-theme \
    cheese \
    code \
    compton \
    curl \
    deluge \
    discord \
    docker \
    dotnet-sdk \
    dunst \
    feh \
    fish \
    freerdp \
    gimp \
    git \
    glances \
    gufw \
    htop \
    i3-gaps \
    i3lock \
    i3status \
    lastpass-cli \
    lib32-nvidia-utils \
    lib32-vulkan-icd-loader \
    libreoffice \
    lm_sensors \
    lutris \
    neofetch \
    networkmanager \
    networkmanager-openvpn \
    networkmanager-pptp \
    nitrogen \
    nodejs \
    npm \
    nvidia \
    nvidia-settings \
    nvidia-settings \
    nvidia-utils \
    nvidia-utils \
    obs-studio \
    openssh \
    pacman-contrib \
    pamixer \
    papirus-icon-theme \
    pavucontrol \
    pulseaudio \
    python-pywal \
    redshift \
    remmina \
    rofi \
    rsync \
    rxvt-unicode \
    scrot \
    speedtest-cli \
    steam \
    tk \
    ttf-fira-code \
    ttf-font-awesome \
    viewnior \
    vlc \
    vulkan-icd-loader \
    wget \
    x11vnc \
    x11vnc \
    xorg \
    xorg-xinit \
    yarn

echoStep "Installing AUR packages"
yay \
    slack-desktop \
    google-chrome \
    s-tui

# xboxdrv # TODO: Check if i need this

echoStep "Creating all the folders we will need"
mkdir -p "$HOME/.config/Code - OSS/User"
mkdir -p "$HOME/.config/dunst"
mkdir -p "$HOME/.config/gtk-3.0"
mkdir -p "$HOME/.config/i3"
mkdir -p "$HOME/.config/i3status"
mkdir -p "$HOME/.config/nitrogen"
mkdir -p "$HOME/.config/profile.d"
mkdir -p "$HOME/.config/wal/templates"
mkdir -p "$HOME/.config/rofi"
mkdir -p "$HOME/.config/Xresources.d"
mkdir -p "$HOME/Pictures/Screenshots"

echoStep "Linking configuraion files"
ln -fs "$DOTFILES/configs/.gitconfig"                                    "$HOME/.gitconfig"
ln -fs "$DOTFILES/configs/.gtkrc-2.0"                                    "$HOME/.gtkrc-2.0"
ln -fs "$DOTFILES/configs/.profile"                                      "$HOME/.profile"
ln -fs "$DOTFILES/configs/.xinitrc"                                      "$HOME/.xinitrc"
ln -fs "$DOTFILES/configs/.config/Code - OSS/User/settings.json"         "$HOME/.config/Code - OSS/User/settings.json"
ln -fs "$DOTFILES/configs/.config/compton.conf"                          "$HOME/.config/compton.conf"
ln -fs "$DOTFILES/configs/.config/dunst/dunstrc"                         "$HOME/.config/dunst/dunstrc"
ln -fs "$DOTFILES/configs/.config/gtk-3.0/gtk.css"                       "$HOME/.config/gtk-3.0/gtk.css"
ln -fs "$DOTFILES/configs/.config/gtk-3.0/settings.ini"                  "$HOME/.config/gtk-3.0/settings.ini"
ln -fs "$DOTFILES/configs/.config/i3/config"                             "$HOME/.config/i3/config"
ln -fs "$DOTFILES/configs/.config/i3status/config"                       "$HOME/.config/i3status/config"
ln -fs "$DOTFILES/configs/.config/redshift.conf"                         "$HOME/.config/redshift.conf"
ln -fs "$DOTFILES/configs/.config/rofi/config"                           "$HOME/.config/rofi/config"
ln -fs "$DOTFILES/configs/.config/rofi/rofi-my-dark-theme.rasi"          "$HOME/.config/rofi/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/.config/wal/templates/dunstrc"                 "$HOME/.config/wal/templates/dunstrc"
ln -fs "$DOTFILES/configs/.config/wal/templates/rofi-my-dark-theme.rasi" "$HOME/.config/wal/templates/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/.config/wal/templates/xresources-00-base"      "$HOME/.config/wal/templates/xresources-00-base"
ln -fs "$DOTFILES/configs/.config/Xresources.d/00-base"                  "$HOME/.config/Xresources.d/00-base"
ln -fs "$DOTFILES/configs/.config/nitrogen/bg-saved.cfg"                 "$HOME/.config/nitrogen/bg-saved.cfg"

echoStep "Configure"
echo '#!/bin/sh'                                                                          >  "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "## Everything in this file will be erased next time you run the dotfiles installer" >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "export DOTFILES=$DOTFILES"                                                          >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "PATH=\$PATH:$DOTFILES/bin"                                                          >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"

echoStep "Enabling services"
# sudo systemctl enable xboxdrv.service # TODO: Test if I need this

echoStep "Done!"
echo "==> You should restart your X session"
