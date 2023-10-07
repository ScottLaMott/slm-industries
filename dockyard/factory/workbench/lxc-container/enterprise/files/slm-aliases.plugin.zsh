#!/usr/bin/zsh
# my alias definitions

alias ".."="cd .."
alias c="clear"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#---  edit
alias v="vim"
alias vs="vim -S .session.vim"
alias n="nvim"

#---  network
alias pgo="ping -c1 -W5 www.google.com"
alias p="ping -c 3 -w5"
alias ns="nmcli connection show"
alias nd="nmcli device show"

#---  git
alias gs= "git status"

#---  ls / df
alias ls="lsd"
alias la="ls -la"
alias ll="ls -l"
alias lR="ls -lR"
alias dfe="df -t ext4"    # fs-type ext4

#---  history
alias hg="history | grep "

#---  tmux
alias ta="tmux attach"
alias tl="tmux switch-client -l"

#---  eyecandy hi hi
alias nf="clear; neofetch"
alias cm="cmatrix -u9"
alias cmr="cmatrix -u9 -r"
alias cct="/usr/bin/theme.sh -i2"

