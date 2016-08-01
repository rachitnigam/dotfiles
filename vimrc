set ts=2
set shiftwidth=2

syntax on

" Tabs as spaces
set expandtab

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

" Merlin Intialization
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Pathogen setup
execute pathogen#infect()

" NERDtree setup
" Default open
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
" Close if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Gruvbox initialize
colors gruvbox 
set background=dark "Setting dark theme
