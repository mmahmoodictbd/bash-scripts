#!/bin/bash

xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode VGA1 1920x1080_60.00

xrandr --output VGA1 --mode 1920x1080_60.00 --left-of LVDS1 --output LVDS1 --mode 1366x768
