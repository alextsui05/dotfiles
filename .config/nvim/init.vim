" Place me in $HOME/.config/nvim

" https://github.com/junegunn/vim-plug#installation
call plug#begin('~/config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

let mapleader = ","
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>ws :wa<cr>:mksession!<cr>
map <leader>qq :wa<cr>:mksession! ~/.last_vim_session<cr>:qa<cr>
map <leader>ls :source Session.vim<cr>
map <leader>ll :source ~/.last_vim_session<cr>
map <leader>ld :lcd %:p:h<cr>
" date +"%Y-%m-%d %H:%M:%S %z"
map <leader>dd a<C-R>=strftime(" %F %H:%M:%S %z")<cr><esc>
map <leader>hg a#ifndef HEADER_GUARD<cr>#define HEADER_GUARD<cr>#endif //HEADER_GUARD<cr><esc>
map <leader>aa a@author Alex Tsui  atsui@ucdavis.edu<esc>
map <leader>dw :%s/\s\+$//e<cr>
map <leader>tt <C-]>:sp<cr><C-W>TgT<C-T>gt:tabmove -1<cr>zR
map <leader>gf gf:sp<cr><C-W>TgT<C-T>gt:tabmove -1<cr>zR
"map <leader>bb :b#<cr>
map <leader>b :CtrlPBuffer<cr>
map <leader>xp :set paste<cr>i<cr><esc>:LineBreakAt \ <cr>:set nopaste<cr>
map <leader>cp :let @" = expand("%")<cr>:q<cr>
map <leader>zc "zyiw
map <leader>zp "zp
map <leader>zP "zP
set pastetoggle=<leader>pp

"Allow normal up/down movement across wrapped lines
noremap j gj
noremap k gk
map <C-m> [m
map <C-n> ]m

set sts=2 " soft tab stop of length 4
set ts=2 " display tab stop length of 4
set sw=2 " shift width of 4
set expandtab
set nu

au BufRead,BufNewFile *.coffee set sts=2
au BufRead,BufNewFile *.coffee set sw=2
au BufRead,BufNewFile *.py set sts=2
au BufRead,BufNewFile *.py set sw=2
au BufRead,BufNewFile *.rb set sts=2
au BufRead,BufNewFile *.rb set sw=2
au BufRead,BufNewFile *.tsx set syntax=typescript

autocmd BufWritePre *.rb   :%s/\s\+$//e
autocmd BufWritePre *.coffee   :%s/\s\+$//e
autocmd BufWritePre *.py   :%s/\s\+$//e
autocmd BufWritePre *.go   :%s/\s\+$//e
autocmd BufWritePre *.js   :%s/\s\+$//e
autocmd BufWritePre *.json   :%s/\s\+$//e
autocmd BufWritePre *.tsx   :%s/\s\+$//e
autocmd BufWritePre *.ts   :%s/\s\+$//e

nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S

if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=node_modules
set wildignore+=*/tmp/*
set wildignore+=*/vendor/bundle/*
let g:ctrlp_max_files=0

" minimap.vim config
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_highlight_search = 1

call deoplete#enable()
