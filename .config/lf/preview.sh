#!/bin/bash

filetype=$(file --mime-type -Lb "$1");

#return 1 after preview to prevent caching so that they can be cleaned and re-rendered

function draw_image {
    kitty +kitten icat --transfer-mode file --place "$2x$3@$4x$5" "$1"
}

function clear_image {
    kitty +kitten icat --transfer-mode file --clear
}

clear_image

case "$filetype" in
    text/*)
        cat "$1"
        ;;
    image/*)
        draw_image "$1" "$2" "$3" "$4" "$5"
        exit 1
        ;;
    application/x-xz | application/gzip)
        tar -tf "$1"
        ;;
    application/zip)
        unzip -l "$1"
        ;;
    video/*) 
        tempPath="/tmp/lf_thumbnail.png" &
        ffmpegthumbnailer -i "$1" -o "$tempPath" -s 512 &
        draw_image "$tempPath" "$2" "$3" "$4" "$5"
        exit 1
        ;;
esac

return 1;
