#!/bin/sh

xinput --set-prop "Logitech USB Receiver" "Coordinate Transformation Matrix" 1.4 0 0 0 1.4 0 0 0 1 &
lxsession &
xset r rate 300 50 &
sh ~/.fehbg &
killall dwm-status; dwm-status &
# picom &

xrdb ~/.Xdefaults

while true; do
	dwm 2> ~/.dwm.log
done
