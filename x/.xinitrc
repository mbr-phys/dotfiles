#! /bin/bash
setxkbmap gb
xset -b
xset s off
xset -dpms
# xetxkbmap -option caps:escape
[[ -f ~/dotfiles/x/Xresources ]] && xrdb -I$HOME ~/dotfiles/x/Xresources
exec i3
