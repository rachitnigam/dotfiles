 "Set shell to bash inside vim
set shell=/bin/bash

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

Plug 'morhetz/gruvbox'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-fugitive'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'gregsexton/MatchTag'
Plug 'vim-scripts/HTML-AutoCloseTag'

Plug 'vim-scripts/utl.vim'
Plug 'vim-scripts/SyntaxRange'

" Languages
Plug 'sheerun/vim-polyglot'
Plug 'psosera/ott-vim', {'autoload':{'filetypes':['ott']}}
Plug 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
Plug 'wlangstroth/vim-racket', {'autoload':{'filetypes':['racket']}}
Plug 'Quramy/tsuquyomi'
Plug 'rgrinberg/vim-ocaml'
Plug 'copy/deoplete-ocaml'
Plug 'tmhedberg/SimpylFold'

" Personal plugins
Plug '~/git/pyret-lang.vim'
Plug '~/git/drracket.vim'

call plug#end()
filetype plugin indent on    " required

if plug_autoinstall
    echo "Installing packages..."
    echo ""
    :PlugInstall
endif

" Disable vim polyglot langauges
let g:polyglot_disabled = ['javascript', 'latex', 'ocaml', 'forth']

syntax on

for filename in sort(split(glob('~/.config/nvim/config/*.vim'), '\n'))
  execute 'source '.filename
endfor

set runtimepath +=~/.config/nvim/config/
