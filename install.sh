#!/bin/sh
set -e

export DOTFILES=`dirname $0`
export DOTFILES=`realpath $DOTFILES`

cd $DOTFILES

# TODO git fetch and check if HEAD == origin/master

echoStep() {
	echo -e "== $1 =="
}

echoStep "Updating pacman keys"
sudo pacman-key --refresh-keys
pacman -Sy archlinux-keyring && pacman -Su

echoStep "Updating pacman packages"
sudo pacman -Syu

echoStep "Installing new pacman packages"
sudo pacman -S --needed \
    arandr \
    arc-gtk-theme \
    aspnet-runtime \
    cbatticon \
    cheese \
    chromium \
    cifs-utils \
    code \
    compton \
    curl \
    deepin-system-monitor \
    deluge \
    discord \
    docker \
    dotnet-host \
    dotnet-runtime \
    dotnet-sdk \
    dunst \
    efibootmgr \
    feh \
    fish \
    freerdp \
    fzf \
    gimp \
    git \
    glances \
    gnome-themes-extra \
    gparted \
    gufw \
    htop \
    i3-gaps \
    i3lock \
    i3status \
    kde-gtk-config \
    lastpass-cli \
    lib32-nvidia-utils \
    lib32-vulkan-icd-loader \
    libreoffice \
    lm_sensors \
    lutris \
    lxappearance \
    network-manager-applet \
    networkmanager \
    networkmanager-openvpn \
    networkmanager-pptp \
    nitrogen \
    nm-connection-editor \
    nodejs \
    npm \
    ntfs-3g \
    nvidia \
    nvidia-settings \
    nvidia-utils \
    obs-studio \
    openssh \
    pacman-contrib \
    pamixer \
    papirus-icon-theme \
    paprefs \
    pasystray \
    pavucontrol \
    polkit \
    polkit-gnome \
    pulseaudio \
    pulseaudio-alsa \
    pulseaudio-jack \
    pulseeffects \
    python-pywal \
    qt5ct \
    redshift \
    remmina \
    rofi \
    rsync \
    rxvt-unicode \
    s-tui \
    scrot \
    speedtest-cli \
    steam \
    steam-native-runtime \
    thunar \
    tk \
    transmission-cli \
    transmission-gtk \
    ttf-fira-code \
    ttf-font-awesome \
    tumbler \
    viewnior \
    vlc \
    vulkan-icd-loader \
    wget \
    x11vnc \
    xdotool \
    xorg \
    xorg-apps \
    xorg-xbacklight \
    xorg-xinit \
    yarn \

echoStep "Updating AUR packages"
yay -Syu \
    --aur \
    --removemake \
    --answerclean a \
    --answerdiff n \

echoStep "Installing new AUR packages"
yay -S \
    --aur \
    --removemake \
    --answerclean a \
    --answerdiff n \
    slack-desktop \
    snapd \
    adwaita-qt \
    jetbrains-toolbox \
    mongodb-compass \
    webtorrent-desktop-bin \

echoStep "Installing Snapd snaps"
systemctl enable snapd
systemctl start snapd
sudo snap install \
    spotify \

echoStep "Installing dotnet tools"
if dotnet tool list -g | grep -q "dotnet-script"
then 
   dotnet tool install -g dotnet-script
else
   dotnet tool update -g dotnet-script
fi

echoStep "Installing npm packages"
npm i

echoStep "Creating all the folders we will need"
mkdir -p "$HOME/.scripts"
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
ln -fs "$DOTFILES/configs/.gitconfig"                                        "$HOME/.gitconfig"
ln -fs "$DOTFILES/configs/.gtkrc-2.0"                                        "$HOME/.gtkrc-2.0"
ln -fs "$DOTFILES/configs/.gtkrc-2.0.mine"                                   "$HOME/.gtkrc-2.0.mine"
ln -fs "$DOTFILES/configs/.profile"                                          "$HOME/.profile"
ln -fs "$DOTFILES/configs/.xinitrc"                                          "$HOME/.xinitrc"
ln -fs "$DOTFILES/configs/.config/compton.conf"                              "$HOME/.config/compton.conf"
ln -fs "$DOTFILES/configs/.config/dunst/dunstrc"                             "$HOME/.config/dunst/dunstrc"
ln -fs "$DOTFILES/configs/.config/gtk-3.0/gtk.css"                           "$HOME/.config/gtk-3.0/gtk.css"
ln -fs "$DOTFILES/configs/.config/gtk-3.0/settings.ini"                      "$HOME/.config/gtk-3.0/settings.ini"
ln -fs "$DOTFILES/configs/.config/i3/config"                                 "$HOME/.config/i3/config"
ln -fs "$DOTFILES/configs/.config/i3status/config"                           "$HOME/.config/i3status/config"
ln -fs "$DOTFILES/configs/.config/profile.d/01-environment-variables.sh"     "$HOME/.config/profile.d/01-environment-variables.sh"
ln -fs "$DOTFILES/configs/.config/redshift.conf"                             "$HOME/.config/redshift.conf"
ln -fs "$DOTFILES/configs/.config/rofi/config"                               "$HOME/.config/rofi/config"
ln -fs "$DOTFILES/configs/.config/rofi/rofi-my-dark-theme.rasi"              "$HOME/.config/rofi/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/.config/wal/templates/dunstrc"                     "$HOME/.config/wal/templates/dunstrc"
ln -fs "$DOTFILES/configs/.config/wal/templates/rofi-my-dark-theme.rasi"     "$HOME/.config/wal/templates/rofi-my-dark-theme.rasi"
ln -fs "$DOTFILES/configs/.config/wal/templates/xresources-theme"            "$HOME/.config/wal/templates/xresources-theme"
ln -fs "$DOTFILES/configs/.config/Xresources.d/00-base"                      "$HOME/.config/Xresources.d/00-base"
ln -fs "$DOTFILES/configs/.config/Xresources.d/10-theme"                     "$HOME/.config/Xresources.d/10-theme"

echoStep "Create profile script for dotfiles environment variables"
echo '#!/bin/sh'                                                                          >  "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "## Everything in this file will be erased next time you run the dotfiles installer" >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "export DOTFILES=$DOTFILES"                                                          >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "PATH=\$PATH:$DOTFILES/bin"                                                          >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
echo "PATH=\$PATH:$HOME/.scripts"                                                         >> "$HOME/.config/profile.d/00-dotfiles-generated.sh"
 
echoStep "Install wallpaper"
nitrogen --head=0 --set-zoom-fill --save "$DOTFILES/wallpaper.*"
nitrogen --head=1 --set-zoom-fill --save "$DOTFILES/wallpaper.*" 2> /dev/null
nitrogen --head=2 --set-zoom-fill --save "$DOTFILES/wallpaper.*" 2> /dev/null
nitrogen --head=3 --set-zoom-fill --save "$DOTFILES/wallpaper.*" 2> /dev/null

echoStep "Configure x11vnc password"
if [ ! -f "~/.vnc/passwd" ]
then
    x11vnc -storepasswd
fi

echoStep "Done!"
echo "==> You should restart your X session"
