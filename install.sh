#!/bin/sh
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
cp .xinitrc ~/.xinitrc

cp -r .config/kitty ~/.config/
cp -r .config/nvim ~/.config/
cp -r .config/ranger ~/.config/

cp -r .config/i3 ~/.config/
cp -r .config/i3status ~/.config/

cp -r .config/awesome ~/.config/
cp -r .config/picom ~/.config/

echo "userChrome.css will have to be installed manually"

cp -r spicetify-themes/* ~/.spicetify/Themes

cp scripts/soundSelect.sh /bin/soundSelect.sh
cp scripts/setbg /bin/setbg
