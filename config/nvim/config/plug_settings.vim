" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#var('omni', 'input_patterns', {
        "\ 'scala': '[^. *\t]\.\w*'
        "\ })
call deoplete#custom#option('sources', {
        \ '_': ['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips', 'LanguageClient'],
        \ })
call deoplete#custom#source('ultisnips', 'matchers', ['matcher_fuzzy'])

" Language servers
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'python': ['pyls'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ 'cpp': ['clangd'],
    \ 'scala': ['metals-vim'],
    \ 'tex': ['texlab'],
    \ }

"let g:LanguageClient_diagnosticsSignsMax = 0
let g:LanguageClient_useVirtualText = "CodeLens"

let g:LanguageClient_diagnosticsDisplay =
      \ {
      \         1: {
      \             "name": "Error",
      \             "texthl": "None",
      \             "signText": "✖",
      \             "signTexthl": "LanguageClientErrorSign",
      \             "virtualTexthl": "Error",
      \         },
      \         2: {
      \             "name": "Warning",
      \             "texthl": "None",
      \             "signText": "⚠",
      \             "signTexthl": "LanguageClientWarningSign",
      \             "virtualTexthl": "Todo",
      \         },
      \         3: {
      \             "name": "Information",
      \             "texthl": "None",
      \             "signText": "ℹ",
      \             "signTexthl": "LanguageClientInfoSign",
      \             "virtualTexthl": "Todo",
      \         },
      \         4: {
      \             "name": "Hint",
      \             "texthl": "None",
      \             "signText": "➤",
      \             "signTexthl": "LanguageClientInfoSign",
      \             "virtualTexthl": "Todo",
      \         },
      \     }

" UtilSnips tigger config.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" fzf settings
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <c-P> :ProjectFiles<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'down': '~20%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler norelativenumber nonumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber
if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

" Theme init
colors afterglow
let g:afterglow_inherit_background=1
set background=dark "Setting dark theme

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

" Markdown setup
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" Styling bad spelling
hi! link SpellBad Underlined
hi! link SpellCap Underlined
hi! link SpellLocal Underlined

set hidden

" Markdown preview: Disable sync scrolling.
let g:mkdp_preview_options = {
    \ 'disable_sync_scroll': 1,
    \ }

" vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
