" ============  Display =================
if has('termguicolors')
  set termguicolors
endif

let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
colorscheme gruvbox-material

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
