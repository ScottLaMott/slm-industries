"---------------------------------------------------
"---
"--- vim mappings
"---

" mapleader
let mapleader=" "

"--- general
map <leader>q  :quit<cr>
map <leader>s  :Startify<cr>
map <leader>lr :!./%<cr>
" map <leader>sr :source $HOME/.config/vim/<cr>
" ??? map <leader>s :source $HOME/.config/nvim/init.vim<cr>

"--- buffers
map <leader>b  :buffers<cr>
map <leader>l  :ls<cr>
map <C-n>      :bnext<CR>
map <C-p>      :bprevious<CR>

"--- windows
map <leader>o  :only<cr>
map <leader>c  :close<cr>

"--- help
map <F2>        <C-T>
map <F3>        <C-]>

"--- fzf
map <leader>fa      :Ag<cr>
map <leader>fc      :Colors<cr>
map <leader>ff      :Files<cr>
map <leader><space> :Buffers<cr>
map <leader>fb      :Buffers<cr>
map <leader>fd      :Buffers<cr>
map <leader>fh      :Helptags<cr>
map <leader>fl      :Lines<cr>
map <leader>fm      :Maps<cr>
map <leader>fr      :Rg<cr>
map <leader>fs      :Snippets<cr>

" --- ERROR ---------------------------------
"echo "hello start error\n"
"     Error detected while processing /home/slm/ws/slm-nixos/configs/vim/maps.vim:
"     line   xx:
"     E484: Can't open file configs/vim/mapscr>'
"
"map <leader>sf      :w | source %<cr>     !!! schmeißt fehler
"map <leader>sf      ':w | source %<cr>'
"map <leader>sf      ':w | :source %<cr>'
"map <leader>sf      ':w | source xfile<cr>'
"map <leader>sf      :echo "xx"<cr>
"map <leader>sf      :echo % | source %<cr>
"map <leader>sf      :source %<cr>

"echo "hello end error\n"
" --- ERROR ---------------------------------

"--- markdown-preview
map <leader>mp :MarkdownPreview<cr>

"--- goyo
map <leader>g  :Goyo<cr>

"--- limelight
map <leader>ll :Limelight!!<cr>

"--- terminal
" für :terminal-mode, exit terminal-mode
tnoremap <Esc><Esc> <C-\><C-n>

"--- mix
"map <leader>j :wincmd j<cr>
"map <leader>k :wincmd k<cr>
"map <leader>h :wincmd h<cr>
"map <leader>l :wincmd l<cr>

