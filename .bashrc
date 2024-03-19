#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=$PATH:/home/joseph/.spicetify
alias config='/usr/bin/git --git-dir=/home/joseph/.dotfiles/ --work-tree=/home/joseph'
