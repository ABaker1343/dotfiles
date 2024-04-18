choices="pretty
pretty-alt
no-pretty
no-pretty-alt"

selection=$(echo "$choices" | rofi -dmenu)

~/.config/hypr/scripts/hyprpretty --"$selection"
