""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" slm@schoco-company.com
"
" nvim profile how slm like it
"
" slm@schoco-company.com
"
" source the vimrc file after saving it
"
if has("autocmd")
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
endif
"
" automatisches installieren von vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
" source plugins
source $HOME/.config/nvim/plugins.vim
call plug#end()


let netrw_banner=1
let g:netrw_liststyle=1   " ausgabeformat im filebrowser

" python support
let g:deoplete#enable_at_startup = 1
"let g:loaded_python_provider = 1
"let g:loaded_python3_provider = 1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" disable nvimgdb
let g:loaded_nvimgdb = 1

" source setting for neovim
source $HOME/.config/nvim/settings.vim

" source mappings for neovim
source $HOME/.config/nvim/maps.vim

" colorscheme
colorscheme jellybeans

runtime! debian.vim

