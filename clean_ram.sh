#!/bin/bash

# Check whether user is root or not
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Free up memory
free -m;
sync;
echo 3 > /proc/sys/vm/drop_caches;
free -m;