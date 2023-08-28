#
# ~/.profile
#

# export EDITOR='nvim'
# export VISUAL='nvim'
export EDITOR='helix'
export VISUAL='helix'

eval `luarocks path --bin`

# start the graphical server

if [ "$(tty)" == /dev/tty1 ]
then
    startx
fi

export PATH=$PATH:/home/alex/.spicetify
