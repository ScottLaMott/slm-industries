""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" slm@schoco-company.com
"
" vim profile how slm like it
"
" slm@schoco-company.com
"
" source the vimrc file after saving it
"
if has("autocmd")
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
endif
"
"
" wenn nicht vorhanden plug.vim installieren, installation plugins mit autocmd
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" vim-airline
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'

" colorschemes
Plug 'https://github.com/nanotech/jellybeans.vim.git', { 'tag': 'v1.7' }
Plug 'https://github.com/jnurmine/Zenburn.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/morhetz/gruvbox.git'

" for .netrw
Plug 'https://github.com/tpope/vim-vinegar.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
"Plug 'https://github.com/tpope/vim-devicon.git'

" deoplete for vim8.1+
"Plug 'https://github.com/Shougo/deoplete.nvim.git' , { 'do': ':UpdateRemotePlugins' }
"Plug 'https://github.com/deoplete-plugins/deoplete-jedi.git'
"Plug 'https://github.com/roxma/vim-hug-neovim-rpc'
"Plug 'https://github.com/roxma/nvim-yarp.git'

" gdb
"Plug 'https://github.com/sakhnik/nvim-gdb.git' , { 'do': ':!./install.sh' }
" fzf
Plug 'https://github.com/junegunn/fzf.git', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'

call plug#end()

"--- airline
let g:airline_powerline_fonts = 1
let g:airline_powerline_bg = 'light'
"let g:airline_highlighting_cache = 1
let g:airline_theme="bubblegum"

let netrw_banner=1
let g:netrw_liststyle=1   " ausgabeformat im filebrowser

" Use deoplete.
set encoding=utf-8
let g:deoplete#enable_at_startup = 1

" python support
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

