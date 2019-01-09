#!/bin/sh

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

xset r rate 220 30
if [ "$HOSTNAME" = "archlinux-imac" ] ; then
	exec .scripts/tools/start-barrierc-imac &
# else
	# manually type start-barriers in dmenu to start the server on the server machine
fi

exec dropbox &
exec i3
