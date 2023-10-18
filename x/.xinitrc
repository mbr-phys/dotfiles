#! /bin/bash
setxkbmap us
xset -b
# xetxkbmap -option caps:escape
[[ -f ~/Xresources ]] && xrdb -I$HOME ~/Xresources
exec i3
