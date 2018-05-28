" Enable vimball plugin
packadd vimball
" Ident using 2 space characters
set shiftwidth=2
set softtabstop=2
set ts=2

" Tabs as spaces
set expandtab

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" split settings
set splitbelow
set splitright

"Highlight current line.
set cursorline

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

" map digraph key
imap <C-q> <C-k>

" define digraphs
digr bt 8869

" line numbers, ruler
set number
set ruler

" set relative line numbers
set relativenumber

" syntax folding, unfolded by default
set foldmethod=syntax
set foldlevelstart=99

" leader hint
set showcmd

" leader set to ,
let mapleader="\<Space>"

set backspace=indent,eol,start

" Color 80 column
set colorcolumn=80

" Define filetypes
augroup set_file_types
  autocmd!
  au BufRead,BufNewFile *.quark set filetype=ocaml
  au BufRead,BufNewFile *.smt set filetype=lisp
  au BufRead,BufNewFile *.v set filetype=coq
  au BufRead,BufNewFile *.html set filetype=htmlm4
augroup end
