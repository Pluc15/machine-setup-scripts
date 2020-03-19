#!/bin/sh
set -e

function usage()
{
    echo "./install.sh"
    echo "\t-h --help"
    echo "\t--refresh-pacman-keys"
    echo ""
}

REFRESH_PACMAN_KEYS=0
export DOTFILES=`dirname $0`
export DOTFILES=`realpath $DOTFILES`

while [ "$1" != "" ]; do
    case $1 in
        -h | --help)
            usage
            exit
            ;;
        --refresh-pacman-keys)
            REFRESH_PACMAN_KEYS=1
            ;;
        *)
            echo "ERROR: unknown parameter \"$PARAM\""
            usage
            exit 1
            ;;
    esac
    shift
done

cd $DOTFILES

# TODO git fetch and check if HEAD == origin/master

echoStep() {
    echo ""
    echo -e "== $1 =="
}

if [ $REFRESH_PACMAN_KEYS -eq 1 ]
then
    echoStep "Updating pacman keys"
    sudo pacman-key --refresh-keys
    pacman -Sy archlinux-keyring && pacman -Su
fi

echoStep "Installing / updating pacman packages"
sudo pacman -Syu --needed \
    arandr \
    arc-gtk-theme \
    arch-audit \
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

echoStep "Installing / updating yay"
pushd ~/.aur
if [ ! -d "yay" ]
then
    git clone https://aur.archlinux.org/yay.git
fi
cd yay
git reset --hard
git pull
makepkg -si --needed
popd

echoStep "Installing / updating AUR packages"
# --needed doesn't prevent redownloading sources. See https://github.com/Jguer/yay/issues/885
yay -Syu \
    --aur \
    --needed \
    --noremovemake \
    --answerclean n \
    --answerdiff n \
    --noconfirm \
    slack-desktop \
    snapd \
    adwaita-qt \
    jetbrains-toolbox \
    mongodb-compass \
    webtorrent-desktop-bin \

echoStep "Installing Snapd snaps"
sudo systemctl enable snapd
sudo systemctl start snapd
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

echoStep "Running pacman packages audit -- PLEASE READ THE OUTPUT"
arch-audit

echoStep "Done!"
echo "==> You should restart your X session"
