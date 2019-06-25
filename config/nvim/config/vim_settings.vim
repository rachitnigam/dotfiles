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
  au BufRead,BufNewFile *.smt set filetype=lisp
  au BufRead,BufNewFile *.rkt set filetype=racket
  au BufRead,BufNewFile *.html set filetype=htmlm4
augroup end

" Use silver searcher if present.
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Close preview window once completion is done.
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" Make preview window not be obnoxiously big
set previewheight=1

" Save and load folds
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup end

" Bind ;; to Esc
imap ;; <Esc>
