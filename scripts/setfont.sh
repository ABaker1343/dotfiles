font=$1
size=$2

font_list=$(fc-list "$font")

if [ "$font_list" == "" ]; then
    echo "font not found"
    exit
fi

echo "font_family $font" > ~/.config/kitty/font.conf
echo "$font" > ~/.config/nvim/prefered_font
echo "exec = gsettings set org.gnome.desktop.interface font-name \"$font\"" > ~/.config/hypr/font.conf
echo "*{font-family: \"$font\"; font-weight: bold;}" > ~/.config/waybar/fonts.css

