#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PS1="\[\e[31m\]λ\[\e[m\]:\W \[\e[31m\]\\$\[\e[m\] " # local setup

[ -f "$HOME/.shortcuts" ] && source "$HOME/.shortcuts" # Load shortcut aliases

# Loading aliases in alias file
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

shdl() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}
se() { du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf | xargs  -r $EDITOR ;}
sv() { vcopy "$(du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf)" ;}
vf() { fzf | xargs -r -I % $EDITOR % ;}

# Miscelaneous
	alias compilec="g++ --std=c++11 *.cpp -fextended-identifiers"
	alias vimall='vim -p $(ls *.{cpp,h,py,cs})'
	alias mountmusic='umount -f ~/music-collection/ ; sshfs 192.168.2.16:Dropbox/Music\ Collection/  ~/music-collection/'
	alias mount-imac='umount -f ~/mount/imac ; sshfs imac:  ~/mount/imac'
	alias mount-linode='umount -f ~/mount/linode ; sshfs linode:  ~/mount/linode'
	alias mount-rpi='umount -f ~/mount/rpi ; sshfs rpi:  ~/mount/rpi'

# Notes
	alias notes="vim -p ~/notes/todos/{daily,food,reminders,buy}.md ~/notes/personnel/2019/2019.md ~/notes/personnel/english/english.md ~/notes/personnel/francais/francais.md ~/notes/personnel/arch-guide/arch-guide.md"
	alias food="vim ~/notes/todos/food.md"
	alias buy="vim ~/notes/todos/buy.md"
	alias todos="vim ~/notes/todos/todos.md"
	alias daily="vim ~/notes/todos/daily.md"
	alias remind="vim ~/notes/todos/reminders.md"
	alias journalLG="vim ~/notes/lionel-groulx/Journal_LG_A18/Journal_LG_A18.md"
	alias arch-guide="vim ~/Dropbox/notes/personnel/arch-guide/arch-guide.md"
	alias drive-pull="drive pull --ignore-name-clashes -depth 4"
	alias youtube-dl-audio="youtube-dl -f bestaudio --extract-audio --embed-thumbnail --add-metadata"

# Addition ranger setting
# Compatible with ranger 1.4.2 through 1.7.*
#
# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.
	function ranger-cd {
		tempfile="$(mktemp -t tmp.XXXXXX)"
		ranger --choosedir="$tempfile" "${@:-$(pwd)}"
		test -f "$tempfile" &&
		if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
			cd -- "$(cat "$tempfile")"
		fi
		rm -f -- "$tempfile"
	}
	alias ranger=ranger-cd

# pyenv
	eval "$(pyenv init -)"

#export OpenCV_INCLUDE_DIRS=/usr/include/opencv4/
# export OpenCV_LIBS=/usr/lib/opencv4/
