sudo pacman -Syu

pushd ~/.aur/google-chrome
git pull
makepkg -si
popd

pushd ~/.aur/spotify
git pull
makepkg -si
popd

pushd ~/.aur/visual-studio-code
git pull
makepkg -si
popd

pushd ~/.aur/x2vnc-no-xinerama
git pull
makepkg -si
popd

pushd ~/.aur/ttf-font-awesome
git pull
makepkg -si
popd

pushd ~/.aur/discord
git pull
makepkg -si
popd

pushd ~/.aur/slack-desktop
git pull
makepkg -si
popd

pushd ~/.aur/fisherman
git pull
makepkg -si
popd

fisher up
