# This file is sourced on all invocations of the shell.
# If the -f flag is present or if the NO_RCS option is
# set within this file, all other initialization files
# are skipped.
#
# This file should contain commands to set the command
# search path, plus other important environment variables.
# This file should not contain commands that produce
# output or assume the shell is attached to a tty.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

if [[ -z "$PATH" || "$PATH" == "/bin:/usr/bin" ]]
then
	export PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
fi

if [[ -d "$HOME/.local/bin" ]]
then
	export PATH="$PATH:$HOME/.local/bin"
fi

# neovim initilization file
export MYVIMRC=$HOME/.config/nvim/init.vim

# display-line when search
export MANPAGER='less -j8'
