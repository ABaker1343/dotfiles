#!/bin/bash

echo "cleaning"
filetype=$(file --mime-type -Lb "$1")

case "$filetype" in
    image/* | video/*) exec kitty +kitten icat --clear > /dev/tty;;
esac

return 0;
