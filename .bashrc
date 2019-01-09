#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PS1="\[\e[31m\]λ\[\e[m\]:\W \[\e[31m\]\\$\[\e[m\] " # local setup

[ -f "$HOME/.shortcuts" ] && source "$HOME/.shortcuts" # Load shortcut aliases

# System Maintainence
alias mw="~/.config/mutt/mutt-wizard.sh"
alias sdn="sudo shutdown now"
alias psref="gpg-connect-agent RELOADAGENT /bye" # Refresh gpg
alias gua="git remote | xargs -L1 git push --all"

# Exporting PATH
export PATH="~/Dropbox/bin:$PATH"

# Some aliases
alias vim="/usr/bin/nvim"
alias e="$EDITOR"
alias p="sudo pacman"
alias SS="sudo systemctl"
alias v="vim"
alias f="vifm"
alias r="ranger"
alias sr="sudo ranger"
alias ka="killall"
alias g="git"
alias trem="transmission-remote"
alias mkd="mkdir -pv"
alias bw="wal -i ~/.config/wall.png" # Rerun pywal
alias ref="shortcuts >/dev/null ; source ~/.bashrc" # Refresh shortcuts manually and reload bashrc
alias mpv="mpv --input-ipc-server=/tmp/mpvsoc$(date +%s)"
alias x="sxiv -ft *"
alias lp="pacman -Qett --color=always | less"

# Adding color
alias ls='ls -hN --color=auto --group-directories-first'
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi" # Color cat - print file with syntax highlighting.

# Internet
alias yt="youtube-dl --add-metadata -i" # Download video link
alias yta="yt -x -f bestaudio/best" # Download only audio
alias ytv="youtube-viewer --results=10 -SV"
alias YT="youtube-viewer"

shdl() { curl -O $(curl -s http://sci-hub.tw/"$@" | grep location.href | grep -o http.*pdf) ;}
se() { du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf | xargs  -r $EDITOR ;}
sv() { vcopy "$(du -a ~/.scripts/* ~/.config/* | awk '{print $2}' | fzf)" ;}
vf() { fzf | xargs -r -I % $EDITOR % ;}

# Miscelaneous
	alias compilec="g++-8 --std=c++11 *.cpp -fextended-identifiers"
	alias vimall='vim -p $(ls *.{cpp,h,py,cs})'
	alias mountmusic='umount -f ~/music-collection/ ; sshfs 192.168.2.16:Dropbox/Music\ Collection/  ~/music-collection/'
	alias mount-imac='umount -f ~/mount/imac ; sshfs imac:  ~/mount/imac'

# Notes
	alias notes="vim -p ~/notes/todos/*.md ~/notes/lionel-groulx/Journal_LG_A18/Journal_LG_A18.md ~/notes/personnel/2018/2018.md"
	alias food="vim ~/notes/todos/food.md"
	alias buy="vim ~/notes/todos/buy.md"
	alias todos="vim ~/notes/todos/todos.md"
	alias daily="vim ~/notes/todos/daily.md"
	alias remind="vim ~/notes/todos/reminders.md"
	alias journalLG="vim ~/notes/lionel-groulx/Journal_LG_A18/Journal_LG_A18.md"
	alias arch-guide="vim ~/Dropbox/notes/Personnel/arch-guide/arch-guide.md"

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
