# set up monitors
xrandr --output HDMI-0 --pos 0x0 --output DVI-D-0 --primary --mode 1920x1080 --pos 1024x0 --rate 144.00

# set up the mouse
MOUSE=$(xinput list --id-only "Kingsis Peripherals ZOWIE Gaming mouse")
ACCELPROP="libinput Accel Speed"
xinput set-prop $MOUSE "libinput Accel Speed" -0.65

# gb keyboard
setxkbmap gb

# make the bar show the time
#~/dwm/barscript.sh &

# set the notification server
dunst &

# start the composite manager
xcompmgr -f -C -I 0.030 -O 0.036 -D 5 &

# restore the desktop background
wal -R -n
nitrogen --restore

# start flameshot so that you can copy screenshots
flameshot &

# start the window manager
# exec dwm
exec i3
