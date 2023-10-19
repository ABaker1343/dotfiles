#
# ~/.bashrc
#
# cd ~

# set the transparency
# transset-df "0.65" --id "$WINDOWID" >/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pacadopt='sudo pacman -Qtdq | sudo pacman -Rns'
alias icat='kitty +kitten icat'
alias vim='nvim'
alias vi='nvim'
alias hx='helix'
alias gvim='neovide'
alias clone='alacritty --working-directory $(pwd) & disown'
alias neovide='WINIT_UNIX_BACKEND=x11 neovide'
#alias neovide='devour neovide'

#PS1='\[\e[1;32m\]\w \[\e[1;34m\] >>\[\e[0m\] '
PS1=$'\u@\H:\[\e[1;32m\]\w \[\e[1;34m\]\udb80\udf3d\n$\[\e[0m\] '
#

export PATH=$PATH:/home/alex/.spicetify:~/.local/bin/

# powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/share/powerline/bindings/bash/powerline.sh
