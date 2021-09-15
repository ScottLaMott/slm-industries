""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" slm@schoco-company.com
"
" loaded plugins
"
" slm@schoco-company.com
"

" vim-airline
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
let g:airline_powerline_fonts    = 1
let g:airline_highlighting_cache = 1
let g:airline_powerline_bg       = 'light'
let g:airline_theme              = 'bubblegum'

" colorschemes
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/rainglow/vim'

let base16colorspace=256  " Access colors present in 256 colorspace
Plug 'https://github.com/chriskempson/base16-vim'

" for .netrw
Plug 'https://github.com/tpope/vim-vinegar.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
"Plug 'https://github.com/tpope/vim-devicon.git'

" python support, completion
"
Plug 'https://github.com/Shougo/deoplete.nvim.git' , { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/deoplete-plugins/deoplete-jedi.git'
" gdb
Plug 'https://github.com/sakhnik/nvim-gdb.git' , { 'do': ':!./install.sh' }
" fzf
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'

call plug#end()
