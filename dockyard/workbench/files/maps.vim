""""""""""""""""""""""""""""""""""""""""""""""""""""
" slm@schoco-company.com
"
" nvim mapping
"
" slm@schoco-company.com
"
""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "

map <leader>s :source $HOME/.config/nvim/init.vim<cr>

map <leader>o :only<cr>
map <leader>q :quit<cr>
map <leader>b :ls<cr>
map <leader>ff :FZF!<cr>
map <leader>f :FZF! -e<cr>
map <leader>sf :sfind

map <leader>j :wincmd j<cr>
map <leader>k :wincmd k<cr>
map <leader>h :wincmd h<cr>
map <leader>l :wincmd l<cr>

map <F2> <C-T>
map <F3> <C-]>

map <F5> :N<CR>
map <F6> :n<CR>

" für :terminal-mode, exit terminal-mode
tnoremap <Esc><Esc> <C-\><C-n>

