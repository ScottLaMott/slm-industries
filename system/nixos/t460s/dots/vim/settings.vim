"---------------------------------------------------
"---
"-- vim settings
"---

autocmd BufWritePre * %s/\s\+$//e    " remove trailing whitespace on write

syntax on
filetype plugin indent on

"--- general
" set cursorline
" set termguicolors " macht den bildschirm schwarz/weiß
set noswapfile
set nobackup
set nowritebackup
set path+=**			                    " für z. B. find-ex-command
set clipboard+=unnamedplus            " use system clipboard
set ignorecase                        " while searching
set nohlsearch                        " highlight match

set background=dark
set scrolloff=8

" --- statusline
set cmdheight=1
set noshowmode

" --- windows
set splitbelow                        " split window to the bottom
set splitright			                  " split window to the right

" --- netrw
let netrw_banner=1
let netrw_liststyle=1
let netrw_sizestyle="H"

"--- fugitive
set diffopt+=vertical

"--- fzf
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

"--- goyo
let g:goyo_width="85%"
let g:goyo_height="95%"

"--- ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" set colors --> gruvbox nord jellybeans molokai happy_hacking habamax
colorscheme gruvbox

" set vim-airline --> bubblegum violet alduin molokai gruvbox
let g:airline_theme="dark_minimal"
"let g:airline_theme="nord"
