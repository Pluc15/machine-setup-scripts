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
