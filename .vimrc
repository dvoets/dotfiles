" ------------------- "
" Basic configuration "
" ------------------- "
set hlsearch                      " highlight search occurrences
set ignorecase                    " ignore case in search patterns
set smartcase                     " no ignore case when pattern is uppercase
set incsearch                     " show search results while typing
set wrapscan                      " searches wrap around the end of the fileet incsearch hlsearch

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


" Clear search highlights 
" http://www.vimbits.com/bits/21
"noremap <silent><Leader>/ :nohls<CR>

call plug#begin('~/.vim/plugged')


" Plug 'davidhalter/jedi-vim'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'hzchirs/vim-material'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'

call plug#end()
filetype plugin indent on    " required
"let g:SuperTabDefaultCompletionType = "<Tab><c-x><c-u>"
"call SuperTabSetDefaultCompletionType("<Tab><c-x><c-u>")

" ------------------------------ "
" Syntax and search highlighting "
" ------------------------------ "
" Enable syntax highlighting
syntax on
set background=dark
"colorscheme solarized
"colorscheme molokai
colorscheme vim-material

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

" disable folding
set nofoldenable    
" vim-ariline + buffer settings
" -----------------------------
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='material'
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

" unimpaired mappings
nnoremap [<space> O<esc>j
nnoremap ]<space> o<esc>k

vmap s S

nnoremap L $
vnoremap L $
nnoremap H ^
vnoremap H ^
" Copy until the end of the line
nnoremap Y v$y
vnoremap Y y$
"noremap ; : "interfears with find next character

" ---------------------"
" Settings for plugins "
" ---------------------"

" Settings for vim-airline
" Avoid conflic python-mode jedi-vim
" let g:pymode_python = 'python3'
" Use all functionalities
"let g:pymode = 1
" no vertical bar after 80 spaces
" let g:pymode_options_colorcolumn = 1
"let g:pymode_virtualenv=1
" let g:pymode_rope = 0

" Turn on the run code script
" let g:pymode_run = 1
" Binds keys to run python code
" let g:pymode_run_bind = '<leader>e'

" Turn on code completion support 
" let g:pymode_rope_completion = 0
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

