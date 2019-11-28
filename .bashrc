#!/bin/bash
stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

# if on main computer don't show hostname in prompt
if [ $(hostname) = "archlinux-mbp" ]; then
	export PS1="\[\e[31m\]λ\[\e[m\]:\W \[\e[31m\]\\$\[\e[m\] " # local setup
else
	export PS1="\[\e[31m\]\h λ\[\e[m\]:\W \[\e[31m\]\\$\[\e[m\] " # local setup
fi

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
# Create new projects
alias createconsole="dotnet new console; dotnet new sln; dotnet sln add *.csproj"
alias mdl='mv ~/Downloads/"$(ls -pt ~/Downloads | grep -v / | head -1)" . '
