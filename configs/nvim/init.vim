" Set shell to bash inside vim
set shell=/bin/bash
let $PATH = $PATH . ':' . expand('~/Library/Haskell/bin')

" Vundle setup
set nocompatible              " be iMproved, required
filetype on                   " Mac requires this
filetype off                  " required

" vim-plug autoinstall if not present.
" From https://github.com/aaronbieber/dotvim/blob/master/vimrc
let plug_autoinstall = 0
let plug_readme = expand('~/.local/share/nvim/site/autoload/plug.vim')
if !filereadable(plug_readme)
    echo "Installing vim-plug..."
    echo ""
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let plug_autoinstall = 1
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dag/vim-fish'
Plug 'luochen1990/rainbow'
Plug 'derekwyatt/vim-scala', { 'for' : 'scala' }
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for' : 'haskell' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'skywind3000/asyncrun.vim'
" Plug 'neomake/neomake'
Plug 'dracula/vim'
Plug 'godlygeek/tabular'
Plug 'altercation/vim-colors-solarized'

call plug#end()
filetype plugin indent on    " required

if plug_autoinstall
    echo "Installing packages..."
    echo ""
    :PlugInstall
endif

" ctrlp setup
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.jar
set wildignore+=*/target/*
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Gruvbox initialize
set background=dark "Setting dark theme
colors solarized

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

" leader set to ,
let mapleader=","

set backspace=indent,eol,start

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" .smt to .lisp
au BufRead,BufNewFile *.smt set filetype=lisp

" Color 100 column
set colorcolumn=100

" Remove trailing whitespace on save
autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e

"Toggle rainbow vim
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

"Indent line turn off color overriding
nnoremap <C-c> :IndentLinesToggle<CR>

" Run neomake async after file save
"autocmd! BufWritePost * Neomake
"autocmd! BufRead * Neomake
