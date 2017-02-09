#!/bin/bash


RED_COLOR_HEAD="\e[1;31m"
RED_COLOR_TAIL="\e[0m"

/bin/echo -e "$RED_COLOR_HEADThis is red text$RED_COLOR_TAIL"

while true
do

    netstat -s > /tmp/netstat
    netstat -lx >> /tmp/netstat

    while read line 
    do
	echo "$line"
	sleep $[ ($RANDOM % 2) ]s
    done < /tmp/netstat

    sleep 1

done