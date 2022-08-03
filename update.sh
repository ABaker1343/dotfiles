#!/bin/sh
cd ~
cp .bashrc dotfiles/.bashrc
cp .bash_profile dotfiles/.bash_profile
cp .xinitrc dotfiles/.xinitrc

cp -r .config/nvim dotfiles/.config/
cp -r .config/ranger dotfiles/.config/

cp -r .config/i3 dotfiles/.config/
cp -r .config/i3status/ dotfiles/.config/

cp -r .config/awesome dotfiles/.config/

cp -r .config/picom dotfiles/.config/

cp .mozilla/firefox/m5q2ch62.default-release/chrome/userChrome.css dotfiles/userChrome.css
