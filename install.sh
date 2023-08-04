#!/bin/sh
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
cp .xinitrc ~/.xinitrc
cp .zshrc ~/.zshrc
cp .zprofile ~/.zprofile

cp -r .config/kitty ~/.config/
cp -r .config/alacritty ~/.config/
cp -r .config/nvim ~/.config/
cp -r .config/ranger ~/.config/
cp -r .config/lf/ ~/.config/
cp -r .config/zathura ~/.config/
cp -r .config/tmux ~/.config/
cp -r .config/powerline ~/.config/
cp -r .config/rofi ~/.config/
cp -r .config/waybar/ ~/.config/
cp -r .config/dunst/ ~/.config/

cp -r .config/i3 ~/.config/
cp -r .config/i3status ~/.config/

cp -r .config/awesome ~/.config/
cp -r .config/hypr/ ~/.config/

cp -r .config/kglobalshortcutsrc ~/.config/
cp -r .config/plasmashellr ~/.config/
cp -r .config/plasma-org.kde.plasma.desktop-appletsrc ~/.config/

cp -r .config/picom ~/.config/

echo "userChrome.css will have to be installed manually"

cp -r spicetify-themes/* ~/.spicetify/Themes

sudo cp scripts/soundSelect.sh /bin/soundSelect.sh
sudo cp scripts/setbg /bin/setbg
sudo cp scripts/layoutSelect.sh /bin/layoutSelect.sh
sudo cp scripts/pywal-extender/pywal-extender /bin/pywal-extender
sudo cp -r sddm.conf.d/ /etc/
