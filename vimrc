" ====================================Plugin setup=================================================
" Vundle setup 
set nocompatible              " be iMproved, required
filetype on                   " Mac requires this
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'morhetz/gruvbox'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dag/vim-fish'
Plugin 'luochen1990/rainbow'
Plugin 'derekwyatt/vim-scala'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" NERDtree setup
" Default open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Gruvbox initialize
set background=dark "Setting dark theme
colors gruvbox

" Airline init
let g:airline_theme='badwolf'
set laststatus=2

" =================================================================================================

set ts=2

syntax on

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

" support scroll wheel and click
set mouse=a

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

