####
#export FZF_DEFAULT_COMMAND='fdfind --hidden --type=f --follow --exclude=.git'

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

#export FZF_DEFAULT_OPTS="--layout=reverse --info=inline --layout=reverse --prompt='EXACT >' -e"
export FZF_DEFAULT_OPTS="--layout=reverse --info=inline --layout=reverse --prompt='FUZZY >'"

# Using highlight (http://www.andre-simon.de/doku/highlight/en/highlight.html)
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"


