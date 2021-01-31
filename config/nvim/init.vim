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

" Disable vim polyglot langauges. Have to do it before loading polyglot.
let g:polyglot_disabled = ['ocaml', 'javascript', 'latex', 'forth', 'go']

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'danilo-augusto/vim-afterglow'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'luochen1990/rainbow'
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
Plug 'tpope/vim-sensible'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/utl.vim'
Plug 'vim-scripts/SyntaxRange'
Plug 'AndrewRadev/linediff.vim'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'

" Languages
Plug 'sheerun/vim-polyglot'
Plug '~/git/vim-p4-syntax'
Plug 'psosera/ott-vim', {'autoload':{'filetypes':['ott']}}
Plug 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
Plug 'wlangstroth/vim-racket', {'autoload':{'filetypes':['racket']}}
Plug 'Quramy/tsuquyomi'
Plug 'rgrinberg/vim-ocaml'
Plug 'tmhedberg/SimpylFold'
Plug 'ekalinin/Dockerfile.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'fatih/vim-go'

" Local languages
Plug '~/git/futil/tools/vim/futil'
Plug '~/git/dahlia/tools/vim'

call plug#end()
filetype plugin indent on    " required

if plug_autoinstall
    echo "Installing packages..."
    echo ""
    :PlugInstall
endif

syntax on

" Execute the vim commands before anything
execute 'source ~/.config/nvim/vim_settings.vim'
for filename in sort(split(glob('~/.config/nvim/config/*.vim'), '\n'))
  execute 'source '.filename
endfor

set runtimepath +=~/.config/nvim/config/
