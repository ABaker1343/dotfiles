#
# ~/.zprofile
#

export PATH=$PATH:/home/alex/.spicetify

export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'

eval `luarocks path --bin`

# start the graphical server

if [ "$(tty)" == /dev/tty1 ]
then
    startx
fi
