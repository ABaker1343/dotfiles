#
# ~/.profile
#

export EDITOR='nvim'
export VISUAL='nvim'

# start the graphical server

if [ "$(tty)" == /dev/tty1 ]
then
    startx
fi

# startx
