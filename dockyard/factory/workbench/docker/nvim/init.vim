""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" slm@schoco-company.com
"
" nvim profile how slm like it
"

if has("autocmd")
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
endif

""" source plugins for neovim
source $HOME/.config/nvim/vim-plug/plugins.vim

""" source setting for neovim
source $HOME/.config/nvim/general/settings.vim

""" source mappings for neovim
source $HOME/.config/nvim/keys/mappings.vim

""" source plugin configs
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/airline.vim

""" python support
let g:python3_host_prog='/usr/bin/python3'
let g:loaded_python3_provider=1

""" colorscheme +++ jellybeans PaperColor abstract focuspoint
set background=dark
colorscheme afterglow

runtime! debian.vim


" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)


