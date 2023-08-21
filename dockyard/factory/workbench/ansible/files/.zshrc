#---------------------------------------------------
#---
#--- slm-zshrc
#---

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -v

# completion --------------------------
zmodload zsh/complist
#
# Use vim keys in tab complete menu:
zstyle ':completion:*' menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# color -------------------------------
# autoload -U colors && colors

# slm ---------------------------------
# Jump to begin of line / insert mode command line history
zle-history-line-set () {
    zle vi-beginning-of-line;
    zle vi-cmd-mode;
}
zle -N zle-history-line-set

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
#

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
	git clone https://github.com/zplug/zplug ~/.zplug
	source ~/.zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.zplug/init.zsh

# Make sure to use double quotes to prevent shell expansion
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "endaaman/lxd-completion-zsh"


# Add a bunch more of your favorite packages!

# Install packages that have not been installed yet
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
        	echo; zplug install
        else
        	echo
        fi
fi

zplug load

# eigene plugins, nich im git-repos
source .local/plugins/slm-aliases.plugin.zsh
source .local/plugins/slm-colored-man-pages.plugin.zsh

# prompt system
autoload -Uz promptinit
promptinit
prompt oliver
