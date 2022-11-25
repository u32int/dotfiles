#!/bin/sh

xinput --set-prop "Logitech USB Receiver" "Coordinate Transformation Matrix" 1.4 0 0 0 1.4 0 0 0 1 &
lxsession &
xset r rate 300 50 &
sh ~/.fehbg &
picom &

# gentoo-pipewire-launcher &
