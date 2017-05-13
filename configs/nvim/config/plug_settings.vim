" Disable vim polyglot langauges
let g:polyglot_disabled = ['javascript', 'typescript', 'latex']

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" Toggle rainbow vim
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Don't autoindent tex files.
augroup tex_no_indent
  au FileType tex setlocal indentexpr=
augroup end

" Settings for hardMode
let g:HardMode_level='wannabe'
let g:HardMode_hardmodeMsg='Dont use this!'
augroup hardmode_setting
  autocmd!
  autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
augroup end
