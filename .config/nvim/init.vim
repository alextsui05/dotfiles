call plug#begin('~/.config/nvim/plugged')
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deoplete.nvim'
Plug 'Rip-Rip/clang_complete'
"Plug 'zchee/deoplete-clang'

call plug#end()
set sts=2 " soft tab stop of length 4
set ts=2 " display tab stop length of 4
set sw=2 " shift width of 4
set expandtab
set nu
au BufRead,BufNewFile *.rb set sts=2
au BufRead,BufNewFile *.rb set sw=2
au BufRead,BufNewFile *.coffee set sts=2
au BufRead,BufNewFile *.coffee set sw=2

call deoplete#enable()
let g:clang_library_path="/usr/lib/llvm-3.8/lib/libclang.so"

autocmd BufWritePre *.rb   :%s/\s\+$//e
autocmd BufWritePre *.coffee   :%s/\s\+$//e
