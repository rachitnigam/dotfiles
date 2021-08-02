" Enable vimball plugin
packadd vimball
" Ident using 2 space characters
set shiftwidth=2
set softtabstop=2
set ts=2

filetype plugin indent on
syntax on

" Tabs as spaces
set expandtab

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
"noremap k gk
"noremap j gj

" map digraph key
imap <C-q> <C-k>

" define digraphs
digr bt 8869

" line numbers, ruler
set number
set ruler

" set relative line numbers
set relativenumber

" unfolded by default
set foldlevelstart=99

" leader hint
set showcmd

" leader set to ,
let mapleader="\<Space>"
let localmapleader="\<Space>"

set backspace=indent,eol,start

" Color 80 column
set colorcolumn=80

" Define filetypes
augroup set_file_types
  autocmd!
  au BufRead,BufNewFile *.smt set filetype=lisp
  au BufRead,BufNewFile *.rkt set filetype=racket
  au BufRead,BufNewFile *.html set filetype=htmlm4
  au BufRead,BufNewFile *.v set filetype=verilog
augroup end

" Use silver searcher if present.
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Close preview window once completion is done.
autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" Make preview window not be obnoxiously big
set previewheight=1

augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup end

set foldmethod=indent
set smartindent

autocmd BufEnter * :syntax sync fromstart

" https://vi.stackexchange.com/questions/11903/working-directory-different-than-current-file-directory
set viewoptions=folds,cursor

" Show tab characters
set list
set listchars=tab:!▸,trail:·

" Dont redraw screen in the middle of a macro
set lazyredraw

" Persistent undo file
set undofile

" Show changes made by an s/ command
set inccommand=nosplit

set signcolumn=yes

set modeline
set modelineexpr

" Allow jumping out of buffer without saving it.
set hidden
