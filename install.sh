#!/bin/sh

# exit if no operation given
if [ -z "$1" ]; then
    echo "No operation specified please choose one of: install, update"
    exit
fi

case $1 in
    "install" | "Install")
        operation="Installing"
        from_dir="$(pwd)/.config"
        to_dir="$HOME/.config"
        ;;
    "update" | "Update")
        operation="Updating"
        from_dir="$HOME/.config"
        to_dir="$(pwd)/.config"
        ;;
    "help" | "--help")
        echo "use one of: install, update, (install to install config files and update to update this repo with your config files)"
        exit
        ;;
    *)
        echo "unrecognised operation please choose one of: install, update"
        exit
        ;;
esac

echo "$operation bash configs"
case "$operation" in
    "Installing")
        echo "Installing will overwrite config directories, make sure you have made backups!"
        echo "Would you like to continue? (y/n)"
        read res
        if [ "$res" != "y" ]; then
            exit
        fi

        cp .bashrc ~/.bashrc
        cp .bash_profile ~/.bash_profile
        ;;
    "Updating")
        cp ~/.bashrc ./.bashrc
        cp ~/.bash_profile ./.bash_profile
        ;;
esac


echo "$operation tui program configs (kitty, ranger, neovim, ,etc...)"
cp -r "$from_dir/kitty" "$to_dir"
cp -r "$from_dir/alacritty" "$to_dir"
cp -r "$from_dir/nvim" "$to_dir"
cp -r "$from_dir/helix" "$to_dir"
cp -r "$from_dir/ranger" "$to_dir"
cp -r "$from_dir/yazi" "$to_dir"
cp -r "$from_dir/zathura" "$to_dir"
cp -r "$from_dir/tmux" "$to_dir"

echo "$operation window manager configs (i3, hyprland, dunst, etc...)"
cp -r "$from_dir/i3" "$to_dir"
cp -r "$from_dir/i3status" "$to_dir"
cp -r "$from_dir/sway" "$to_dir"
cp -r "$from_dir/waybar" "$to_dir"
cp -r "$from_dir/hypr" "$to_dir"
cp -r "$from_dir/rofi" "$to_dir"
cp -r "$from_dir/dunst" "$to_dir"
cp -r "$from_dir/xdg-desktop-portal" "$to_dir"

echo "$operation kde configs"
cp -r "$from_dir/kglobalshortcutsrc" "$to_dir"
cp -r "$from_dir/plasmashellr" "$to_dir"
cp -r "$from_dir/plasma-org.kde.plasma.desktop-appletsrc" "$to_dir"

echo "$operation sddm configs (root permission needed)"
#case "$operation" in 
    #"Installing")
        #sudo cp -r sddm/sddm.conf.d/ /etc/
        #sudo cp -r sddm/sddm-wal-theme/ /usr/share/sddm/themes/
        #;;
#esac

echo "$operation scripts (root permission needed)"
case "$operation" in
    #"Installing")
        #sudo cp scripts/setbg /bin/setbg
        #sudo cp scripts/pywal-extender/pywal-extender /bin/pywal-extender
        #;;
    "Updating")
        cp /bin/setbg scripts/setbg
        ;;
esac

echo "userChrome.css will have to be installed manually"

