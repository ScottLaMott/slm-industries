" my on setting

autocmd BufWritePre * %s/\s\+$//e       " remove trailing whitespace on write

syntax on
"--- fugitive
set diffopt+=vertical

filetype plugin indent on

"--- general
set guicursor=
set background=dark
"set termguicolors
set nobackup
set nowritebackup
set noswapfile			" (~)
set splitright			" neues window nach rechts
set splitbelow			" neues window nach rechts
set number relativenumber
set nocursorline
set nocursorcolumn
set scrolloff=999
set path+=**			" für z. B. find-ex-command
set clipboard+=unnamedplus      " use system clipboard
