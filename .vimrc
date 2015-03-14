" See also /opt/local/share/vim/vim71/vimrc_example.vim
"
" Plugins i use:
" surround http://www.vim.org/scripts/script.php?script_id=1697
" repeat http://www.vim.org/scripts/script.php?script_id=2136
" nerdtree http://www.vim.org/scripts/script.php?script_id=1658
" a http://www.vim.org/scripts/script.php?script_id=31
"
" @version 1.0.0
" @date 2013-08-15 11:50:31 -0700
" @author Alex Tsui

" Vundle config
source ~/.vim/.vundlerc

" enable syntax highlighting
" highlight searched terms
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" automatically indent on next line
set smartindent

" show line numbers
set nu

" tab width 4; use spaces only
set sts=4 " soft tab stop of length 4
set ts=4 " display tab stop length of 4
set sw=4 " shift width of 4
set et " expand tab
set sta " smart tab

" allow backspace
set backspace=indent,eol,start

" break lines before col 78, between words
"set textwidth=78
set lbr

" allow folding by indentation
set foldmethod=indent

" autocomplete for java (vim 7)
"
" autocomplete file available at:
" http://www.vim.org/scripts/script.php?script_id=1785
"setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#CompleteParamsInfo

" Convenient command to see the difference between the current buffer and
" the file it was loaded from, thus the changes you made.
" command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
"        \ | wincmd p | diffthis

filetype plugin on
set grepprg=grep\ -nH\ $*
" filetype indent on
" let g:tex_flavor='latex'

set mouse=a

set wildmenu

" allow the . to execute once for each line of a visual selection
" http://vim.wikia.com/wiki/VimTip84
vnoremap . :normal .<cr>

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

map <F2> yypw"zPa::<ESC>$xa<CR>{<CR><CR>}<ESC>kkkkdd

"NERDTree bindings
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeQuitOnOpen = 1
map <leader>nt :NERDTree<cr>

set modeline

set scrolloff=5

"Allow normal up/down movement across wrapped lines
noremap j gj
noremap k gk
map <C-m> [m
map <C-n> ]m

map <S-TAB> :tabprevious<cr>

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=*.html --exclude=build/* .<CR>

" Strip trailing whitespace
autocmd BufWritePre *.cpp :%s/\s\+$//e
autocmd BufWritePre *.h   :%s/\s\+$//e
autocmd BufWritePre *.tex   :%s/\s\+$//e
autocmd BufWritePre *.py   :%s/\s\+$//e
autocmd BufWritePre CMakeLists.txt   :%s/\s\+$//e

"if has("autocmd")
"    autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"    \ exe "normal g`\"" |
"    \ endif
"endif

au BufRead,BufNewFile *.R set filetype=r
au BufRead,BufNewFile *.f set sts=3
au BufRead,BufNewFile *.f set sw=3
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.tex set filetype=tex
au BufRead,BufNewFile Makefile.inc set filetype=make
au BufNewFile *Test.cpp :r!cat ~/Templates/FooTest.cpp
au BufNewFile CMakeLists.txt :r!cat ~/Templates/CMakeLists.txt

let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../../../src/CGAL_Qt4,sfr:../../include/CGAL/Qt'
let g:alternateNoDefaultAlternate = 1

set spellfile=$HOME/Dropbox/toolbox/vim/spell/en.utf-8.add

set exrc
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'

let g:marching_clang_command = '/usr/bin/clang'
let g:marching#clang_command#options = {
\ 'cpp' : '-std=c++11'
\}

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

let g:marching_include_paths = [
            \ '/usr/include',
            \ '/usr/include/qt4',
            \ '/usr/include/qt4/QtGui',
            \ '/usr/include/qt4/QtCore',
            \ '/usr/include/vtk-6.0'
            \]


let s:save_cwd = getcwd()
let s:tmp_dir = s:save_cwd
while s:tmp_dir != '/' && !filereadable(s:tmp_dir . "/.includes_list")
    cd ..
    let s:tmp_dir = getcwd()
endwhile
if filereadable(s:tmp_dir . "/.includes_list")
    let g:marching_include_paths += readfile(s:tmp_dir . "/.includes_list")
endif
exe 'cd' s:save_cwd
set tags+=../tags,../../tags,../../../tags

let g:marching_enable_neocomplete = 1

"if !exists('g:neocomplete#sources#omni#input_patterns')
"    let g:neocomplete#sources#omni#input_patterns = {}
"endif
""let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
""let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::\w*'
if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._ = ['buffer']

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::\w*'

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:neocomplete#force_omni_input_patterns.python =
\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

set updatetime=200

autocmd FileType cs setlocal omnifunc=OmniSharp#Complete
let g:neocomplete#force_omni_input_patterns.cs = '.*[^=\);]'
let g:neocomplete#sources.cs = ['omni']

autocmd FileType html NeoCompleteLock

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

nmap f <Plug>Sneak_s
nmap F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap f <Plug>Sneak_s
omap F <Plug>Sneak_S



"set wildignore+=*/build/*
let g:ctrlp_custom_ignore = getcwd() . '/build'
