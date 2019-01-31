" Remove trailing whitespace on save
augroup no_trailing_whitespace
  autocmd!
  autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup end

augroup global_commands " {
  au!

  " Key bindings for buffers
  au FileType * :nnoremap <leader>bn :bn<CR>
  au FileType * :nnoremap <leader>bp :bp<CR>
  au FileType * :nnoremap <leader>ba :badd
  au FileType * :nnoremap <leader>bd :bdelete<CR>

  " Key bindings for saving quickly
  au FileType * :nnoremap <leader>w :w<CR>
  au FileType * :nnoremap <leader>q :qa<CR>

  " Error commands
  au FileType * :nnoremap <leader>eq :ccl<CR>
  au FileType * :nnoremap <leader>en :cn<CR>
  au FileType * :nnoremap <leader>ef :cf<CR>

  " Tag search commands
  au FileType * :nnoremap <leader>] :ts<CR>

  " Get the highlight group under the cursor.
  au FileType * :nnoremap <leader>sp :call <SID>SynStack()<CR>
augroup END " }

" Key bindings for git fugitive
augroup git_commands " {
  autocmd!
  autocmd FileType * :nnoremap <leader>gd :Gdiff<CR>
augroup END " }

" Key bindings for typescript
augroup ts_commands
  autocmd!
  autocmd FileType typescript nmap <buffer> <Leader>tt : <C-u>echo tsuquyomi#hint()<CR>
augroup end

" Key bindings for Ocaml
augroup ocaml_commands
  autocmd!
  au FileType ocaml :nnoremap <leader>mt :MerlinTypeOf<CR>
  au FileType ocaml :nnoremap <leader>mk :MerlinDestruct<CR>
  au FileType ocaml nmap <leader>mr <Plug>(MerlinRename)
augroup end

" RainbowToggle conflicts with ocaml syntax highlighting.
augroup ocaml_hooks
  autocmd!
  autocmd FileType ocaml RainbowToggle
  autocmd FileType coq RainbowToggle
  autocmd FileType typescript RainbowToggle
  autocmd FileType ocaml source ~/.config/nvim/lang/ocaml.vim
augroup end

" Requires Syntax range to be installed
augroup html_hooks
  autocmd!
  autocmd FileType html call SyntaxRange#Include('<script type=\"text\/javascript\">','</script>','javascript','NonText')
  autocmd FileType html call SyntaxRange#Include('<style>','</style>','css','NonText')
augroup end

nnoremap <silent> <C-n> :nohl<CR><C-l>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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
