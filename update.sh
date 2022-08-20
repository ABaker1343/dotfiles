#!/bin/sh
cd ~
cp ~/.bashrc ~/.source/dotfiles/.bashrc
cp ~/.bash_profile ~/.source/dotfiles/.bash_profile
cp ~/.xinitrc ~/.source/dotfiles/.xinitrc

cp -r ~/.config/kitty ~/.source/dotfiles/.config/
cp -r ~/.config/nvim ~/.source/dotfiles/.config/
cp -r ~/.config/ranger ~/.source/dotfiles/.config/

cp -r ~/.config/i3 ~/.source/dotfiles/.config/
cp -r ~/.config/i3status/ ~/.source/dotfiles/.config/

cp -r ~/.config/awesome ~/.source/dotfiles/.config/

cp -r ~/.config/picom ~/.source/dotfiles/.config/

cp ~/.mozilla/firefox/m5q2ch62.default-release/chrome/userChrome.css ~/.source/dotfiles/userChrome.css

#spicetify colors file
cp ~/.config/spicetify/Themes/marketplace/color.ini ~/.source/dotfiles/color.ini
# shell scripts
cp /bin/soundSelect.sh ~/.source/dotfiles/soundSelect.sh
cp /bin/setbg ~/.source/dotfiles/setbg
