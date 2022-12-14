#!/bin/sh
cd ~
cp ~/.bashrc ~/.source/dotfiles/.bashrc
cp ~/.bash_profile ~/.source/dotfiles/.bash_profile
cp ~/.xinitrc ~/.source/dotfiles/.xinitrc
cp ~/.zprofile ~/.source/dotfiles/.zprofile
cp ~/.zshrc ~/.source/dotfiles/.zshrc

cp -r ~/.config/kitty ~/.source/dotfiles/.config/
cp -r ~/.config/alacritty ~/.source/dotfiles/.config/
cp -r ~/.config/nvim ~/.source/dotfiles/.config/
cp -r ~/.config/ranger ~/.source/dotfiles/.config/

cp -r ~/.config/i3 ~/.source/dotfiles/.config/
cp -r ~/.config/i3status/ ~/.source/dotfiles/.config/

cp -r ~/.config/awesome ~/.source/dotfiles/.config/

cp -r ~/.config/picom ~/.source/dotfiles/.config/

cp ~/.mozilla/firefox/m5q2ch62.default-release/chrome/userChrome.css ~/.source/dotfiles/userChrome.css

#spicetify theme and colors files
cp -r ~/.spicetify/Themes/Sleek ~/.source/dotfiles/spicetify-themes/

# shell scripts
cp /bin/soundSelect.sh ~/.source/dotfiles/scripts/soundSelect.sh
cp /bin/setbg ~/.source/dotfiles/scripts/setbg
cp /bin/layoutSelect.sh ~/.source/dotfiles/scripts/layoutSelect.sh
