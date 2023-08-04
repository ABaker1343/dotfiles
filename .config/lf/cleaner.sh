#!/bin/bash

filetype=$(file --mime-type -Lb "$1")
#kitten icat --clear > /dev/tty

case "$filetype" in
    image/* | video/*)kitty +kitten icat --clear > /dev/tty;;

esac

return 1;
