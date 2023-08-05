#!/bin/bash

filetype=$(file --mime-type -Lb "$1");

#return 1 after preview to prevent caching so that they can be cleaned and re-rendered

case "$filetype" in
    text/*) cat "$1";;
    image/*) exec kitty +kitten icat --silent --place "${2}x${3}@${4}x${5}" --stdin no --transfer-mode memory "$1" > /dev/tty & return 1;;
    application/x-xz | application/gzip) tar -tf "$1";;
    application/zip) unzip -l "$1";;
    video/*) 
        tempPath="/tmp/lf_thumbnail.png" &
        ffmpegthumbnailer -i "$1" -o "$tempPath" -s 512 &
        exec kitty +kitten icat --silent --place "${2}x${3}@${4}x${5}" --stdin no --transfer-mode file "$tempPath" > /dev/tty & return 1;;
esac

return 1;
