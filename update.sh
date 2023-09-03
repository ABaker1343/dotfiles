#!/bin/sh
cp ~/.bashrc ./.bashrc
cp ~/.bash_profile ./.bash_profile
cp ~/.xinitrc ./.xinitrc
cp ~/.zprofile ./.zprofile
cp ~/.zshrc ./.zshrc
cp ~/.vimrc ./.vimrc

cp -r ~/.config/kitty ./.config/
cp -r ~/.config/alacritty ./.config/
cp -r ~/.config/nvim ./.config/
cp -r ~/.config/helix ./.config/
cp -r ~/.config/ranger ./.config/
cp -r ~/.config/lf/ ./.config/
cp -r ~/.config/zathura ./.config/
cp -r ~/.config/tmux ./.config/
cp -r ~/.config/powerline ./config/
cp -r ~/.config/rofi ./.config/
cp -r ~/.config/waybar/ ./.config/
cp -r ~/.config/dunst/ ./.config/

cp -r ~/.config/i3 ./.config/
cp -r ~/.config/i3status/ ./.config/

cp -r ~/.config/awesome ./.config/
cp -r ~/.config/hypr ./.config/
cp -r ~/.config/gammastep ./.config/

cp -r ~/.config/kglobalshortcutsrc ./.config/
cp -r ~/.config/plasmashellr ./.config/
cp -r ~/.config/plasma-org.kde.plasma.desktop-appletsrc ./.config/

cp -r ~/.config/picom ./.config/

cp ~/.mozilla/firefox/m5q2ch62.default-release/chrome/userChrome.css ./userChrome.css

#spicetify theme and colors files
cp -r ~/.spicetify/Themes/Sleek ./spicetify-themes/

# shell scripts
cp /bin/soundSelect.sh ./scripts/soundSelect.sh
cp /bin/setbg ./scripts/setbg
cp /bin/layoutSelect.sh ./scripts/layoutSelect.sh

# sddm config
cp -r /etc/sddm.conf.d/ ./sddm/
cp -r /usr/share/sddm/themes/sddm-wal-theme/ ./sddm/

# emacs config
# cp ~/.config/emacs/init.el ./.config/emacs/init.el
# cp ~/.config/emacs/config.org ./.config/emacs/config.org
