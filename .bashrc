#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

#export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
export PS1="\[\e[31m\]λ\[\e[m\]:\W \[\e[31m\]\\$\[\e[m\] " # local setup

[ -f "$HOME/.shortcuts" ] && source "$HOME/.shortcuts" # Load shortcut aliases

# Loading aliases in alias file
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"

# pyenv
# eval "$(pyenv init -)"

## To change dpi on the fly, must rerun i3 after
# xrdb -merge <(echo "Xft.dpi: 240 ")

# check how manually set the screen dpi setting
# $ xdpyinfo | grep -B 2 resolution
# might affect stuff
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5
