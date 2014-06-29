set nocompatible
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

set backupdir=~/.vim/vim-tmp
set autoindent
set scrolloff=3
set tabstop=4
set expandtab
set shiftwidth=4
set backspace=indent,eol,start
set ignorecase
set smartcase
set foldlevelstart=15
set hidden
set completeopt=menu
au! FileType python setl nosmartindent
let mapleader = ' '
let maplocalleader = '-'
let g:pymode_lint_checkers = ['pyflakes', 'pep8']

nnoremap H ^
nnoremap L $
nnoremap gg :call Toggle_gg_scroll()<cr>
nnoremap <leader>wq <c-w><c-j>:q<esc>

nnoremap <leader>ev :w<cr>:edit $MYVIMRC<cr>:nnoremap <buffer> q :w<lt>cr><lt>c-^>:source $MYVIMRC<lt>cr><cr>
nnoremap <leader>esv :split<cr>:edit $MYVIMRC<cr>:nnoremap <buffer> q :wq<lt>cr>:source $MYVIMRC<lt>cr><cr>
nnoremap <localleader>ev :w<cr>:execute ':silent !mkdir -p ~/.vim/ftplugin/' . &filetype<cr>:execute ':edit ~/.vim/ftplugin/' . &filetype . '/default.vim'<cr><cr>
nnoremap <localleader>esv :execute ':! mkdir -p ~/.vim/ftplugin/' . &filetype<cr>:split<cr>:execute ':edit ~/.vim/ftplugin/' . &filetype . '/default.vim'<cr><cr>
nnoremap <localleader><cr> :execute ':source ~/.vim/ftplugin/' . &filetype . '/default.vim'<cr>
noremap <leader>j J
noremap <leader>k K
nnoremap <leader>h H
nnoremap <leader>l L
noremap <c-j> 9j
noremap <c-k> 9k
nnoremap <leader>/ /\v
nnoremap <leader>wk <c-w><c-k>:q<esc>


nnoremap <leader>)= F=wi(<esc>A)
nnoremap <leader>(= A)<esc>F=wi(<esc>i
nnoremap <leader>)) Bi)<esc>Ea)
nnoremap <leader>(( Ea)<esc>Bi(<esc>i
nnoremap <leader>(X f)xF(dBx
nnoremap <leader>)X F(xf)D
nnoremap aa I
nnoremap as lBi
nnoremap ad lbi
nnoremap af i
nnoremap aj a
nnoremap ak hea
nnoremap al hEa
nnoremap a; A

nnoremap ' `
nnoremap ` '

nnoremap <leader>p "0P

nnoremap <leader>! :w<cr>:source <c-r>%<cr>

nnoremap <leader>.: :call DoDotMacro_Func()<cr>
nnoremap <leader>.. :execute 'normal ' . g:do_dot_macro<cr>

augroup templategroup
    autocmd!
    "enter autocommands here
augroup END


function! DoDotMacro_Func()
    let g:do_dot_macro = input('> ')
    execute 'normal ' . g:do_dot_macro
endfunction

function! Toggle_gg_scroll()
    if !exists("b:toggle_gg_scroll")
        let b:toggle_gg_scroll = 0 
    endif
    nnoremap j gj
    nnoremap k gk
    if b:toggle_gg_scroll
        nunmap j
        nunmap k
    endif
    let b:toggle_gg_scroll = !b:toggle_gg_scroll 
endfunction
