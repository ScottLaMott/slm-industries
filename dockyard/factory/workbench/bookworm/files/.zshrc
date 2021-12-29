# vi mode command line mode
bindkey -v

# history settings
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# wenn plugins existieren dann plugins sourcen
[[ -f ~/.local/plugins/slm-aliases.plugin.zsh ]]           && source ~/.local/plugins/slm-aliases.plugin.zsh
[[ -f ~/.local/plugins/slm-colored-man-pages.plugin.zsh ]] && source ~/.local/plugins/slm-colored-man-pages.plugin.zsh
[[ -f ~/.local/plugins/slm-fzf.plugin.zsh ]]               && source ~/.local/plugins/slm-fzf.plugin.zsh
#[[ -f ~/.local/plugins/slm-powerline.plugin.zsh ]]         && source ~/.local/plugins/slm-powerline.plugin.zsh

# fzf shortcuts und completion
[[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[[ -f /usr/share/doc/fzf/examples/completion.zsh ]]   && source /usr/share/doc/fzf/examples/completion.zsh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# ssh ???
export SSH_KEY_PATH="~/.ssh/rsa_id"

# jump to insert mode / begin of line in command line history
zle-history-line-set () { zle vi-beginning-of-line; }
zle -N zle-history-line-set

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# prompt system
autoload -Uz promptinit
promptinit
prompt fade

