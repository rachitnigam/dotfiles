" Vim-plug setup
set nocompatible              " be iMproved, required
filetype on                   " Mac requires this
filetype off                  " required

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
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

call plug#end()            " required
filetype plugin indent on    " required