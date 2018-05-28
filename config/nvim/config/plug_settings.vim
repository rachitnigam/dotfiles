" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" UtilSnips tigger config.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ctrlp setup
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.jar,*.pdf,*.aux,*.log
set wildignore+=*/target/*
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Theme init
set background=dark "Setting dark theme
colors gruvbox

" Airline init
let g:airline_theme='angr'
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z=''
set laststatus=2

" ctags -- Use tags file in the directory
set tags=tags;/

" set terminal color to 256
set t_Co=256

" Toggle rainbow vim
let g:rainbow_active = 1

" Space with NERDCommenter
let g:NERDCommenter = 1

" Settings for Tsuquyomi
let g:tsuquyomi_completion_detail = 1
augroup tsuquyomi_settings
  autocmd!
  autocmd FileType typescript setlocal completeopt+=menu,preview
augroup end

" Setting for delimMate
augroup delimMate_settings
  au FileType racket let b:loaded_delimitMate = 1
augroup end

"if !exists('g:deoplete#omni#input_patterns')
  "let g:deoplete#omni#input_patterns = {}
"endif
"let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete

"augroup vimtex_commands
  "au!
  "au FileType tex :nnoremap <leader>ll :VimtexCompile<CR>
  "au FileType tex :nnoremap <leader>lc :VimtexClean<CR>
  "au FileType tex :nnoremap <leader>lv :VimtexView<CR>
  "au FileType tex :nnoremap <leader>le :VimtexErrors<CR>
  "au FileType tex :nnoremap <leader>ls :VimtexStatus<CR>
"augroup end

