# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alex/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PROMPT='%B%F{green}%~ %F{blue}%n  >> %F{white}%b'

alias ls='ls --color=auto'
alias pacadopt='sudo pacman -Qtdq | sudo pacman -Rns'
alias vim='nvim'
