 "Set shell to bash inside vim
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
Plug 'luochen1990/rainbow'
Plug 'derekwyatt/vim-scala', { 'for' : 'scala' }
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for' : 'haskell' }
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'skywind3000/asyncrun.vim'
Plug 'godlygeek/tabular'
Plug 'altercation/vim-colors-solarized'
Plug 'jelera/vim-javascript-syntax'

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

" Theme init
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
let mapleader="\<Space>"

set backspace=indent,eol,start

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Color 100 column
set colorcolumn=80

"Toggle rainbow vim
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Remove trailing whitespace on save
autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e

" .smt to .lisp
au BufRead,BufNewFile *.smt set filetype=lisp

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Latex command macros
augroup latex_macros " {
  autocmd!
  autocmd FileType tex :nnoremap <leader>lc :w<CR>:!rubber --pdf --warn all %<CR>
  autocmd FileType tex :nnoremap <leader>ll :set conceallevel=2 <CR>
  autocmd FileType tex :nnoremap <leader>lo :set conceallevel=0 <CR>
augroup END " }

augroup buffer_commands " {
  autocmd!
  autocmd FileType * :nnoremap <leader>bn :bn<CR>
  autocmd FileType * :nnoremap <leader>bp :bp<CR>
  autocmd FileType * :nnoremap <leader>ba :badd
  autocmd FileType * :nnoremap <leader>bd :bdelete<CR>
augroup END " }

augroup save_command " {
  autocmd!
  autocmd FileType * :nnoremap <leader>w :w<CR>
  autocmd FileType * :nnoremap <leader>q :wq<CR>
augroup END " }

augroup git_command " {
  autocmd!
  autocmd FileType * :nnoremap <leader>gd :Gdiff<CR>
augroup END " }
