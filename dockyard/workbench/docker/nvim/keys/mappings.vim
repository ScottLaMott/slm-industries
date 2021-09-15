""""""""""""""""""""""""""""""""""""""""""""""""""""
" slm@schoco-company.com
"
" nvim mapping
"
" slm@schoco-company.com
"

let mapleader=" "

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize +2<CR>
nnoremap <M-l>    :vertical resize -2<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

map <leader>so :source $HOME/.config/nvim/init.vim<cr>
map <leader>o  :only<cr>
map <leader>q  :quit<cr>
map <leader>f  :Files<cr>
map <leader>sf :sfind
" test
map <leader>c  :close<cr>
map <leader>bd :bdelete<cr>
map <leader>s  :Startify<cr>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" tab navigation for :help
map <F2> <C-T>
map <F3> <C-]>

map <F5> :N<CR>
map <F6> :n<CR>

" für :terminal-mode, exit terminal-mode
tnoremap <Esc><Esc> <C-\><C-n>

