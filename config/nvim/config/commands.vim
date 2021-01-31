" Remove highlighting from current file
nnoremap <silent> <C-n> :nohl<CR><C-l>

" bind gs to grep word under cursor
nnoremap gs :Ag <C-R><C-W><CR>

" Key bindings for buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>ba :badd<CR>
nnoremap <leader>bd :bdelete<CR>

" Shortcut to insert line in normal mode.
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Key bindings for saving quickly
nnoremap <leader>w :w<CR>
nnoremap <leader>q :qa<CR>

" Error commands
nnoremap <leader>eq :ccl<CR>
nnoremap <leader>en :cn<CR>
nnoremap <leader>ef :cf<CR>

" Tag search commands
nnoremap <leader>] :ts<CR>

" Open undo tree
nnoremap <leader>tt :UndotreeToggle<CR>

" Get the highlight group under the cursor.
nnoremap <leader>sp :call <SID>SynStack()<CR>

" Insert today's date under the cursor
nnoremap <leader>id :read !date -u +"\%m-\%d-\%Y"<CR>

" Toogle NerdTree
nnoremap <leader>nt :NERDTreeToggle<CR>

" Remove trailing whitespace on save
augroup no_trailing_whitespace
  autocmd!
  autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup end

" Key bindings for git fugitive
augroup git_commands " {
  autocmd!
  autocmd FileType * :nnoremap <leader>gd :Gdiff<CR>
augroup END " }

" Makefile settings
augroup make_commands
  autocmd FileType make set nolist
augroup end

" Key bindings for typescript
augroup ts_commands
  autocmd!
  autocmd FileType typescript nmap <buffer> <Leader>tt : <C-u>echo tsuquyomi#hint()<CR>
augroup end

" RainbowToggle conflicts with syntax highlighting.
augroup ocaml_hooks
  autocmd!
  autocmd FileType ocaml RainbowToggle
  autocmd FileType coq RainbowToggle
  autocmd FileType typescript RainbowToggle
  autocmd FileType ocaml source ~/.config/nvim/lang/ocaml.vim
augroup end

" File types i write with.
augroup writing_hooks
  autocmd!
  " this one is which you're most likely to use?
  autocmd FileType tex,markdown :set spell spelllang=en_us
  autocmd FileType tex,markdown :setl noai nocin nosi inde=
augroup end

" Requires Syntax range to be installed
augroup html_hooks
  autocmd!
  autocmd FileType html call SyntaxRange#Include('<script type=\"text\/javascript\">','</script>','javascript','NonText')
  autocmd FileType html call SyntaxRange#Include('<style>','</style>','css','NonText')
augroup end

" Setup LSP
function SetLSPShortcuts()
  " Keybindings
  nnoremap <silent> <C-]> :call LanguageClient#textDocument_definition()<CR>
  nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent> <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <silent> <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <silent> <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <silent> <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <silent> <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <silent> <leader>lm :call LanguageClient_contextMenu()<CR>
  set completefunc=LanguageClient#complete
endfunction()

augroup LSP
  autocmd!
  autocmd FileType rust,python,ocaml,cpp,scala call SetLSPShortcuts()
augroup END

" Search for current selection. From: http://vim.wikia.com/wiki/Search_for_visually_selected_text
function! s:getSelectedText()
  let l:old_reg = getreg('"')
  let l:old_regtype = getregtype('"')
  norm gvy
  let l:ret = getreg('"')
  call setreg('"', l:old_reg, l:old_regtype)
  exe "norm \<Esc>"
  return l:ret
endfunction

vnoremap <silent> * :call setreg("/",
    \ substitute(<SID>getSelectedText(),
    \ '\_s\+',
    \ '\\_s\\+', 'g')
    \ )<Cr>n

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader>sp :call <SID>SynStack()<CR>
