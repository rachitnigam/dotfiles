" ============  Display =================
if has('termguicolors')
  set termguicolors
endif

" ============= Autocomplete =================
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" ================= Quality of Life =================

" NERD Commenter
let g:NERDCreateDefaultMappings = 0 " dont create default mappings
let g:NERDSpaceDelims = 1  " spaces after comment

" ================ Trouble.nvim ================
autocmd! FileType Trouble
autocmd  FileType Trouble set laststatus=0 noshowmode noruler norelativenumber nonumber
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler number relativenumber

" ================ DelimitMate =================
let delimitMate_expand_cr = 2 " Natural behavior when pressing enter.

" ================ vim-airline ==================
" Try to set airline theme, fallback to default if not available
try
  let g:airline_theme='gruvbox-material'
catch
  let g:airline_theme='dark'
endtry
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z=''
set laststatus=2

let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 1,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
