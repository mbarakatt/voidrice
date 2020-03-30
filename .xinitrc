#!/bin/sh

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

# 30 minutes before the screen goes blanks
    xset s 1800 1800  

# Theses lines can be here or in an Xconfig file.
# I added super+space as a shortcut to toggle between the two layout in i3 
    # Setting the compose key to Right Alt
        # setxkbmap -option compose:Alt_R
    # Configuring two keyboard layouts
        # setxkbmap -model pc104 -layout us,ca -variant intl,multi

wal --theme base16-dracula

exec dropbox &
exec syncthing -no-browser -home="$HOME/.config/syncthing" &
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

