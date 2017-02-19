call plug#begin('~/.config/nvim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim'
Plug 'Rip-Rip/clang_complete'
Plug 'justinmk/vim-sneak'
"Plug 'zchee/deoplete-clang'

call plug#end()
set sts=2 " soft tab stop of length 4
set ts=2 " display tab stop length of 4
set sw=2 " shift width of 4
set expandtab
set nu

"Allow normal up/down movement across wrapped lines
noremap j gj
noremap k gk
map <C-m> [m
map <C-n> ]m

au BufRead,BufNewFile *.rb set sts=2
au BufRead,BufNewFile *.rb set sw=2
au BufRead,BufNewFile *.coffee set sts=2
au BufRead,BufNewFile *.coffee set sw=2

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


call deoplete#enable()
let g:clang_library_path="/usr/lib/llvm-3.8/lib/libclang.so"

autocmd BufWritePre *.rb   :%s/\s\+$//e
autocmd BufWritePre *.coffee   :%s/\s\+$//e

nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S
