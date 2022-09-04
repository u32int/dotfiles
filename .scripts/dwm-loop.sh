#!/bin/sh

# make sure the Xdefaults is loaded before dwm
xrdb ~/.Xdefaults

while true; do
	dwm 2> ~/.dwm.log
done


