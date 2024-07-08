#
# ~/.bashrc
#
# cd ~

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias pacadopt='sudo pacman -Qtdq | sudo pacman -Rns'
alias icat='kitty +kitten icat'
alias vim='nvim'
alias vi='nvim'
# alias vim='helix'
# alias vi='helix'
alias hx='helix'
alias gvim='neovide'
alias clone='alacritty --working-directory $(pwd) & disown'
alias neovide='WINIT_UNIX_BACKEND=x11 neovide'
alias fullclear="printf '\E[H\E[3J'"
#alias neovide='devour neovide'
alias tabletdriver='systemctl --user start opentabletdriver.service --now'
#alias brichbench='protontricks-launch --appid 32440 "/home/alex/Games/BrickBench/BrickBench.exe"'
alias brickbench='protontricks -c "/home/alex/Games/BrickBench/BrickBench.exe" 32440'

#PS1='\[\e[1;32m\]\w \[\e[1;34m\] >>\[\e[0m\] '
PS1=$'\u@\H:\[\e[1;32m\]\w \[\e[1;34m\]\udb80\udf3d\n$\[\e[0m\] '
#

export PATH=$PATH:/home/alex/.spicetify:~/.local/bin/

