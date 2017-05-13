" Remove trailing whitespace on save
augroup no_trailing_whitespace
  autocmd!
  autocmd FileType * autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup end

augroup set_file_types
  autocmd!
  au BufRead,BufNewFile *.quark set filetype=ocaml
  au BufNewFile,BufRead *.arr set filetype=pyret
  au BufRead,BufNewFile *.smt set filetype=lisp
  au BufRead *.html set filetype=htmlm4
augroup end

" Latex command macros
augroup latex_commands " {
  autocmd!
  autocmd FileType tex :nnoremap <leader>lc :w<CR>:!rubber --pdf --warn all %<CR>
  autocmd FileType tex :nnoremap <leader>ll :set conceallevel=2 <CR>
  autocmd FileType tex :nnoremap <leader>lo :set conceallevel=0 <CR>
augroup END " }

" Key bindings for buffers
augroup buffer_commands " {
  autocmd!
  autocmd FileType * :nnoremap <leader>bn :bn<CR>
  autocmd FileType * :nnoremap <leader>bp :bp<CR>
  autocmd FileType * :nnoremap <leader>ba :badd
  autocmd FileType * :nnoremap <leader>bd :bdelete<CR>
augroup END " }

" Key bindings for saving quickly
augroup save_commands " {
  autocmd!
  autocmd FileType * :nnoremap <leader>w :w<CR>
  autocmd FileType * :nnoremap <leader>q :q<CR>
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

augroup make_commands " {
  autocmd!
  autocmd FileType * :nnoremap <leader>m :make<CR>
augroup END " }

augroup error_commands " {
  autocmd!
  autocmd FileType * :nnoremap <leader>eq :ccl<CR>
  autocmd FileType * :nnoremap <leader>en :cn<CR>
  autocmd FileType * :nnoremap <leader>ef :cf<CR>
augroup END " }
