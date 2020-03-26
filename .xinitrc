#!/bin/sh

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

xset s 1800 1800 # 30 minutes before the screen goes blanks
setxkbmap -option compose:Alt_R

wal --theme base16-dracula
exec dropbox &
# exec redshift &
tty_number=$(who | grep -v pts | awk '{print $2}')
if [ ${tty_number} = "tty1" ]; then
    exec i3
fi
if [ ${tty_number} = "tty2" ]; then
    exec i3
fi
if [ ${tty_number} = "tty3" ]; then
    exec bspwm
fi

