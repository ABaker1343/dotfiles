#!/bin/sh

operation="installing"

function CopyConfig ()
{
    local from=$1
    local to=$2
    shift; shift
    local config_dirs=("$@")

    if ! [ -d $to ]; then
        mkdir "$to"
    fi

    for dir in "${config_dirs[@]}"
    do
        echo "$operation $dir config files"
        cp -r "$from/$dir" "$to"
    done
}

SHELL_FILES=(
    ".bashrc"
    ".bash_profile"
    ".zshrc"
)

CONFIG_DIRS=(
    "kitty"
    "alacritty"
    "nvim"
    "helix"
    "ranger"
    "yazi"
    "zathura"
    "tmux"
    "i3"
    "i3status"
    "sway"
    "waybar"
    "hypr"
    "rofi"
    "dunst"
    "fastfetch"
    "xdg-desktop-portal"
    "kglobalshortcutsrc"
    "kwinrulesrc"
    "plasmashellrc"
    "plasma-org.kde.plasma.desktop-appletsrc"
)

# exit if no operation given
if [ -z "$1" ]; then
    echo "No operation specified please choose one of: install, update"
    exit
fi

case $1 in
    "install" | "Install")
        operation="Installing"
        echo "Installing configs, please make sure that you have made backups of current configs\n Continue? [y/n]"
        read res
        if [ "$res" != "y" ]; then
            exit
        fi

        echo "Installing configuration files..."
        CopyConfig "$(pwd)/.config" "$HOME/.config" "${CONFIG_DIRS[@]}"
        CopyConfig "$(pwd)/" "$HOME/" "${SHELL_FILES}"
        echo "userChrome.css will have to be installed manually"
        ;;

    "update" | "Update")
        operation="Updating"
        echo "Updating configuration files..."
        CopyConfig "$HOME/.config" "$(pwd)/.config" "${CONFIG_DIRS[@]}"
        CopyConfig "$HOME/" "$(pwd)/" "${SHELL_FILES}"
        cp /usr/local/bin/setbg scripts/
        ;;

    "scripts" | "Scripts")
        if ! [ $(id -u) == 0 ]; then
            echo "Installing scripts requires root permissions"
            exit
        fi
        echo "Installing setbg script"
        cp scripts/setbg /usr/local/bin/setbg
        chmod o-w /usr/local/bin/setbg
        chmod o+x /usr/local/bin/setbg

        echo "Installing pywal extension script"
        cp scripts/pywal-extender/pywal-extender /usr/local/bin/pywal-extender
        chmod o-w /usr/local/bin/pywal-extender
        chmod o+x /usr/local/bin/pywal-extender

        echo "Installing setfont script"
        cp scripts/setfont /usr/local/bin/set-desktop-font
        chmod o-x /usr/local/bin/set-desktop-font
        chmod o+x-w /usr/local/bin/set-desktop-font

        exit
        ;;

    "packages" | "Packages")
        echo "Installing packages requires root permissions"
        pacman -Syu $(cat ./pacman_packages)
        ;;

    "flatpak" | "Flatpak")
        echo "Installing flatpak packages"
        flatpak install $(cat flatpak_packages)
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

