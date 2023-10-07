#!/usr/bin/zsh
# my alias definitions
#
alias c='clear'
alias pgo='ping -c1 -W5 www.google.com'
alias p='ping -c 3 -w5'

# ls
alias ls='lsd'
alias la='ls -la'
alias ll='ls -l'
alias lR='ls -lR'

# grep in history
alias hg='history | grep '

# python not found
#alias t='python ~/ws/git/t/t.py --task-dir ~/tasks --list tasks'

# git, falsch neu ergooglen
#alias gitlog 'log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit h

# ansible not found
#alias ansp='ansible -m ping'

# fuzzy finder
alias f='fzf'
alias v='vim $(fzf)'

# eyecandy hi hi
alias bat='batcat'
alias cm='cmatrix -r'
alias nf='neofetch'
#
