#!/bin/bash

filetype=$(file --mime-type -Lb "$1");

case "$filetype" in
    text/*) cat $"1"; return 1;;
    image/*) kitty +kitten icat --silent --place "${2}x${3}@${4}x${5}" --stdin no --transfer-mode file "$1" > /dev/tty; return 1;;
    application/x-xz | application/gzip) tar -tf "$1"; return 1;;
    application/zip) unzip -l "$1"; return 1;;
esac

# return 1 to prevent caching
return 1;
