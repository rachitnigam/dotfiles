source ~/.vimrc.plugins

" NERDtree setup
" Default open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" crtl p setup
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     
set wildignore+=*/target/*

" Gruvbox initialize
set background=dark "Setting dark theme
colors gruvbox

" Airline init
let g:airline_theme='badwolf'
set laststatus=2

" Use tags file in the directory
set tags=tags;/

" set terminal color to 256
set t_Co=256

set ts=2
syntax on

" Settings for hardMode
let g:HardMode_level='wannabe'
let g:HardMode_hardmodeMsg='Dont use this!'
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

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

" word wrap
set linebreak
" make k and j behave as expected on wrapped lines
noremap k gk
noremap j gj

" Disable auto-commneting to next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

" =================================Key bindings====================================================

"Toggle rainbow vim
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
nnoremap <C-c> :RainbowToggle<CR>
" NERDtree open
map <C-n> :NERDTreeToggle<CR>

" =================================================================================================

