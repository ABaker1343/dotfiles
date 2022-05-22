#
# ~/.bashrc
#

# set the transparency
# transset-df "0.65" --id "$WINDOWID" >/dev/null

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\e[1;34m\u \e[36m\W\e[0m > '
# PS1='[\u@\h \W]\$ '
