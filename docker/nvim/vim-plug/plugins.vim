""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" slm@schoco-company.com
"
" loading plugins
"
" slm@schoco-company.com
"
" automatisches installieren von vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

  """ vim-airline ----------------------------------------------------
  Plug 'https://github.com/vim-airline/vim-airline.git'
  Plug 'https://github.com/vim-airline/vim-airline-themes.git'

  """ colorschemes -----------------------------------------------------------------------
  Plug 'https://github.com/rafi/awesome-vim-colorschemes'

  """ .netrw -----------------------------------------------------------------------------
  Plug 'https://github.com/tpope/vim-vinegar.git'
  Plug 'https://github.com/tpope/vim-fugitive.git'

  """ automatic pairs
  Plug 'jiangmiao/auto-pairs'

  """ fzf --------------------------------------------------------------------------------
  Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'https://github.com/junegunn/fzf.vim'

  """ tmux  -----------------------------------------------------------------------------
  Plug 'christoomey/vim-tmux-navigator'

  """ vimwiki  -----------------------------------------------------------------------------
  Plug 'vimwiki/vimwiki'

  """ startify -----------------------------------------------------------------------------
  Plug 'mhinz/vim-startify'

  """ markdown preview in browser ----------------------------------------------------------
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

  """ verschiedene -------------------------------------------------------------------------
  Plug 'https://github.com/junegunn/goyo.vim'

call plug#end()
