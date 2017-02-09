#!/bin/bash

# Optimize JPEG images

EXTENSIONS="jpe?g"

if [ -z "$1" ]; then
    DIR="`pwd`"
else
    DIR="$1"
fi


# Using jpegoptim (sudo apt-get install jpegoptim)
find "$DIR" -regextype posix-egrep -regex ".*\.($EXTENSIONS)\$" -type f | xargs -I{} jpegoptim --strip-all "{}.optimized" "{}"

# Rename xxx.jpg.optimized -> xxx.jpg
find "$DIR" -name '*.optimized' -print0 | while read -d  $'\0' file; do 
    chown $(stat -c "%U:%G" "${file%.optimized}") "$file"
    chmod $(stat -c "%a" "${file%.optimized}") "$file"
    mv -f "$file" "${file%.optimized}"; 
done


# Using jpegtran (DL: http://jpegclub.org/jpegcrop.tar.gz)
find "$DIR" -regextype posix-egrep -regex ".*\.($EXTENSIONS)\$" -type f | xargs -I{} ~/Downloads/jpegcrop/jpeg-9b/jpegtran -copy none -optimize -progressive -outfile "{}.optimized" "{}"

# Rename xxx.jpg.optimized -> xxx.jpg
find "$DIR" -name '*.optimized' -print0 | while read -d  $'\0' file; do 
    chown $(stat -c "%U:%G" "${file%.optimized}") "$file"
    chmod $(stat -c "%a" "${file%.optimized}") "$file"
    mv -f "$file" "${file%.optimized}"; 
done
