#!/usr/bin/zsh
# my alias definitions
#
alias c='clear'
alias pgo='ping -c1 -W5 www.google.com'
alias p='ping -c 3 -w5'

# ls + df
alias la='ls -la'
alias ll='ls -l'
alias lR='ls -lR'
alias dfe='df -t ext4'                    # fs-type ext4

# history
alias hg='history | grep '

# tumx + tmuxinator
alias tml='tmux list-session'
alias mux='tmuxinator'
# ?? alias tmh='tmux set-window-option main-pane-height 25 ; tmux select-layout main-horizontal'

# git
alias config='/usr/bin/git --git-dir=/home/christoph/.cfg/ --work-tree=/home/christoph'

# ansible
alias ansp='ansible -m ping'

# ag silversearcher
#alias fd='fdfind'

# batcat
alias bat='batcat'

# eyecandy hi hi
alias cm='cmatrix -r'
alias nf='neofetch'

# t
alias t='python2 ~/ws/git/t/t.py --task-dir ~/tasks --list tasks'
alias tl='python2 ~/ws/git/t/t.py --task-dir ~/tasks --list tasks-lisa'
alias tg='python2 ~/ws/git/t/t.py --task-dir ~/tasks --list tasks-godwin'

# git, falsch neu ergooglen
#alias gitlog 'log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit h

