#! /bin/bash
setxkbmap gb
xset -b


# xetxkbmap -option caps:escape
[[ -f ~/dotfiles/x/Xresources ]] && xrdb -I$HOME ~/dotfiles/x/Xresources
exec i3
