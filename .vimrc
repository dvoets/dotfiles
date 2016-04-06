" ------------------- "
" Basic configuration "
" ------------------- "

set nu				" show number lines
set nocompatible               	" ignore vi compatability

filetype off                   	" required for multiple plugins

set modelines=0			        " increases security; is nr of lines vim checks
                                " at start of file for init variables

au FocusLost * :wa		        " save on losing focus

set encoding=utf-8

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" ---------------------------- "
" Navigation and key remapping "
" ---------------------------- "

" change leader key
let mapleader = "\<space>"             " Rebind <Leader> key
" let mapleader = ","             " Rebind <Leader> key
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
"nmap <Leader><Leader> V

" Copy & paste to system clipboard with <Space>p and <Space>y
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Allow moving between splits by pressing Ctrl+hjkl.
" http://www.vimbits.com/bits/10
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Improve up/down movement on wrapped lines 
" http://www.vimbits.com/bits/25
nnoremap j gj
nnoremap k gk


" Disable F1 key (next to esc)
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" use 'jj' to escape faster
imap jj <ESC>

" no more arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Remember last postion
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" ------------------------------ "
" Syntax and search highlighting "
" ------------------------------ "
" Enable syntax highlighting
syntax on
set background=dark
colorscheme solarized

" Clear search highlights 
" http://www.vimbits.com/bits/21
"noremap <silent><Leader>/ :nohls<CR>

" Vundle setup
" ------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required! 
Plugin 'VundleVim/Vundle.vim'

" Bundles
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'scrooloose/nerdtree'
"Bundle 'scrooloose/nerdcommenter'
"Bundle 'sjl/gundo.vim'
"Bundle 'christoomey/vim-tmux-navigator'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'aperezdc/vim-template'
"Bundle 'vim-pandoc/vim-pandoc'
"Bundle 'plasticboy/vim-markdown'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'chrisbra/csv.vim'

call vundle#end()            " required
filetype plugin indent on    " required
"let g:SuperTabDefaultCompletionType = "<Tab><c-x><c-u>"
"call SuperTabSetDefaultCompletionType("<Tab><c-x><c-u>")

" Python options
" --------------

" enable all Python syntax highlighting features
"let python_highlight_all = 1
"build in vim autocompletion, jedi-vim beter?
"autocmd FileType python set omnifunc=pythoncomplete#Complete

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" vim-ariline + buffer settings
" -----------------------------
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" ---------------------"
" Settings for plugins "
" ---------------------"

" Settings for vim-airline
" Avoid conflic python-mode jedi-vim
let g:pymode_python = 'python3'
" Use all functionalities
"let g:pymode = 1
" no vertical bar after 80 spaces
let g:pymode_options_colorcolumn = 0
"let g:pymode_virtualenv=1
let g:pymode_rope = 0

" Turn on the run code script
let g:pymode_run = 1
" Binds keys to run python code
let g:pymode_run_bind = '<leader>e'

" Turn on code completion support 
let g:pymode_rope_completion = 0
" Turn on autocompletion when typing a period
"let g:pymode_rope_complete_on_dot = 1
" Keymap for autocomplete
"let g:pymode_rope_completion_bind = '<C-Space>'

" Needed to activate vim-airline
" https://github.com/bling/vim-airline/wiki/FAQ
"set laststatus=2
"let g:airline#extensions#tabline#enabled = 1        "Show buffers on top

" Settings for python-mode

"disable rope (python-mode) use jedi-vim
" let g:pymode_rope = 0

" Settings for NERDTree
"noremap  <F2> :NERDTreeToggle<cr>
"inoremap <F2> <esc>:NERDTreeToggle<cr>
"
"au Filetype nerdtree setlocal nolist            "what does this do?
"
"let NERDTreeHighlightCursorline=1
"let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$']

