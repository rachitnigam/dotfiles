" Set shell to bash inside vim
set shell=/bin/bash

" Source plugins
source ~/.config/nvim/nvim.plugins

" ctrlp setup
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/target/*
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Gruvbox initialize
set background=dark "Setting dark theme
colors gruvbox

" Airline init
let g:airline_theme='badwolf'
set laststatus=2

" ctags -- Use tags file in the directory
set tags=tags;/

" set terminal color to 256
set t_Co=256

set ts=2
syntax on

" Settings for hardMode
let g:HardMode_level='wannabe'
let g:HardMode_hardmodeMsg='Dont use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" split settings
set splitbelow
set splitright

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move between windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

" set relative line numbers
set relativenumber
" Tabs as spaces
set expandtab
" Ident using 2 space characters
set shiftwidth=2
set softtabstop=2

" indentation fixes
set autoindent
set smartindent
filetype plugin indent on

" show matching parens
set showmatch
" show search terms
set hls

" search as you type
set incsearch

" make search case insensitive
set ignorecase

" word wrap
set linebreak
" make k and j behave as expected on wrapped lines
noremap k gk
noremap j gj

" line numbers, ruler
set number
set ruler

" syntax folding, unfolded by default
set foldmethod=syntax
set foldlevelstart=99

" leader hint
set showcmd

set backspace=indent,eol,start

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"set storage dirs
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" .smt to .lisp
au BufRead,BufNewFile *.smt set filetype=lisp

" Color 100 column
set colorcolumn=100

" Remove trailing whitespace on save
autocmd FileType rust,scala,ocaml,java autocmd BufWritePre <buffer> :%s/\s\+$//e

"Toggle rainbow vim
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"Indent line turn off color overriding
nnoremap <C-c> :IndentLinesToggle<CR>
