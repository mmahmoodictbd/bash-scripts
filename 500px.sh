#!/bin/bash


for line in `wget --referer='http://500px.com/editors' --quiet -O- http://500px.com/popular | grep "from=popular" | sed -n 's/.*<img src="\([^"]*\)".*/\1/p' | sed s/"3.jpg"/"4.jpg"/ | sed s/"?t".*$//`; do wget -O $RANDOM.jpg --quiet "$line"; done
