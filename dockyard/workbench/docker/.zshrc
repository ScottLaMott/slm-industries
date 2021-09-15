# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# powerline9k-theme
POWERLEVEL10K_PROMPT_ON_NEWLINE=false
POWERLEVEL10K_LEFT_PROMPT_ELEMENTS=(user host dir vcs)
POWERLEVEL10K_MODE='nerdfont-complete'
POWERLEVEL10K_COLOR_SCHEME='light'

ZSH_THEME="powerlevel10k/powerlevel10k"

source ~/.dotbare/dotbare.plugin.zsh

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#source ~/.local/plugins/slm-powerline.plugin.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ssh ???
export SSH_KEY_PATH="~/.ssh/rsa_id"

# we like vi
setopt vi
bindkey -v

# always begin of line and command mode in zle
zle-history-line-set () {
  zle vi-beginning-of-line
  zle vi-cmd-mode
}
zle -N zle-history-line-set

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export DISABLE_AUTO_TITLE='true'

# init fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.local/plugins/key-bindings.zsh
source ~/.local/plugins/completion.zsh
source ~/.local/plugins/slm-fzf.plugin.zsh            # Beispiele aus dem Netz

# eigene plugins
source ~/.local/plugins/slm-aliases.plugin.zsh
source ~/.local/plugins/slm-colored-man-pages.plugin.zsh

#source ~/.local/plugins/slm-powerline.plugin.zsh

# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
_dotbare_completion_cmd

