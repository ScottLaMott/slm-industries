
let g:startify_bookmarks = [
            \ { 'z': '~/.zshrc' },
            \ { 't': '~/.tmux.conf' },
            \ { 'i': '~/.config/i3/config' },
            \ { 'n': '~/.config/nvim/init.vim' },
            \ { 'p': '~/.config/nvim/vim-plug/plugins.vim' },
            \ { 'o': '~/.oh-my-zsh/oh-my-zsh.sh' },
            \ { 'w': '~/vimwiki/index.wiki' },
            \ '~/ws',
            \ ]

let g:startify_lists = [
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ ]

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_custom_header = [
\ '                                                                                                 ',
\ '                              				       _                 ____                  _            ',
\ '                    				            __  | |  _ __ ___     / __ \    ___    ___  | |__         ',
\ '                              				/ __| | | | `_ ` _ \   / / _` |  / __|  / __| | |_ \        ',
\ '	                              			\__ \ | | | | | | | | | | (_| | | (__  | (__  | |_) |       ',
\ '                              				|___/ |_| |_| |_| |_|  \ \__,_|  \___|  \___| |_.__/        ',
\ '				                                                      \____/                              ',
\ '                                                                                                 ',
\ '                                                                                                 ',
\ ]
