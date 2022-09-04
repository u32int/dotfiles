#!/bin/sh

gentoo-pipewire-launcher &
xinput --set-prop "Logitech USB Receiver" "Coordinate Transformation Matrix" 1.4 0 0 0 1.4 0 0 0 1 &
xset r rate 300 50 &
sh ~/.fehbg &
