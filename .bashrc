#
# ~/.bashrc
#
cd ~

# set the transparency
# transset-df "0.65" --id "$WINDOWID" >/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pacadopt='sudo pacman -Qtdq | sudo pacman -Rns -'


# PS1='\[\e[1;34m\]\W >\[\e[0m\] '
# PS1='\[\e[1;32m\]\u \[\e[35m\]\W\[\e[0m\] > '
# PS1='[\u@\h \W]\$ '
PS1='\[\e[1;32m\]\W \[\e[1;34m\]>\[\e[0m\] '

export PATH=$PATH:/home/alex/.spicetify
