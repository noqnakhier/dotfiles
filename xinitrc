#!/bin/bash

export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

fcitx5 &
picom &
feh --recursive --randomize --bg-fill $HOME/Pictures/backgrounds
xmobar $HOME/xmobar/xmobarrc &

$HOME/DotFiles/scripts/startdwm
# exec xmonad
