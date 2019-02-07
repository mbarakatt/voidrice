#!/bin/sh

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

xset s 1800 1800 # 30 minutes before the screen goes blanks
if [ "$HOSTNAME" = "archlinux-imac" ] ; then
	exec .scripts/tools/start-barrierc-imac &
# else
	# manually type start-barriers in dmenu to start the server on the server machine
fi

exec dropbox &
exec redshift &
exec i3
