" ------------------------------ "
" Syntax and search highlighting "
" ------------------------------ "
syntax enable
set background=dark
colorscheme solarized

au FocusLost * :wa        " save on losing focus

set encoding=utf-8
set autoindent
imap jj <Esc>
set number        " Show line numbers

"show a visual line under the cursor's current line 
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" ---------------------------- "
" Navigation and key remapping "
" ---------------------------- "

" Allow moving between splits by pressing Ctrl+hjkl.
" http://www.vimbits.com/bits/10
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Improve up/down movement on wrapped lines 
nnoremap j gj
nnoremap k gk

" no more arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"Plugin 'klen/python-mode'
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" SuperTab plugin
"Plugin 'ervandew/supertab'
" Solarized
Plugin  'altercation/vim-colors-solarized'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----------------------- " 
" Python specific options "
" ----------------------- "

"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" enable all Python syntax highlighting features
let python_highlight_all = 1

let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0
