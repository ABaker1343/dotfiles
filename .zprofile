#
# ~/.zprofile
#

export EDITOR='nvim'
export VISUAL='nvim'

eval `luarocks path --bin`

# start the graphical server

if [ "$(tty)" == /dev/tty1 ]
then
    startx
fi

export PATH=$PATH:/home/alex/.spicetify
