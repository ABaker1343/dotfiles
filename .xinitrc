#
make sure the luarocks path is set
eval "$(luarocks path --bin)"
# set up monitors
xrandr --output HDMI-0 --pos 0x0 --output DVI-D-0 --primary --mode 1920x1080 --pos 1024x0 --rate 144.00

# set up the mouse
#MOUSE=$(xinput list --id-only "Razer Razer Viper Mini")
#ACCELPROP="libinput Accel Speed"
#xinput set-prop $MOUSE "libinput Accel Speed" -0.65
xinput set-prop "pointer:Razer Razer Viper Mini" "libinput Accel Speed" -0.65

# set the key repeat delay
xset r rate 300 50

# gb keyboard
setxkbmap gb

# make the bar show the time
#~/.source/dwm/barscript.sh &

# set the notification server
dunst &

# start the composite manager
#xcompmgr -f -C -I 0.030 -O 0.036 -D 5 &
#picom --experimental-backend --config ~/.config/picom/picom.conf &

# restore the desktop background
wal -R -n
echo "background_opacity 0.75" >> ~/.cache/wal/colors-kitty.conf
#nitrogen --restore

# start flameshot so that you can copy screenshots
flameshot &

# start the nightlight
redshift -l 50:3.5 &

# clipboard manager
copyq &

#start screen recorder
gpu-screen-recorder -c mp4 -f 60 -w DVI-D-0 -a "$(pactl get-default-sink).monitor" -a "$(pactl get-default-source)" -o /bigboi/recorder-save -r 30 &

# start the window manager
#exec budgie-desktop
#exec dwm
exec awesome
#exec i3
