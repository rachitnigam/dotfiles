lua << EOF
local nvim_lsp = require'lspconfig'

--- Create buffer local mappings for LSP
local function on_attach()
  local wk = require("which-key")

  vim.api.nvim_buf_set_keymap(0, "n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", {})

  --- Top bindings
  wk.register({
    ["<C-]"] = "definition",
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "hover" },
  }, { buffer = 0 })

  --- LSP
  wk.register({
    l = {
      name = "language",
      D = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "implementation" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "type definition" },
      x = { "<cmd>Telescope lsp_references<CR>", "references" },
      s = { "<cmd>lua vim.lsp.buf.document_symbol()<CR>", "document symbol" },
      w = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "workspace symbol" },
      d = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
      a = { "<cmd>Telescope lsp_code_actions<CR>", "action" },
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "format" },
      e = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostic()<CR>", "line diagnostic" },
    },
  }, { prefix = "<leader>", buffer = 0 })

  --- Errors
  wk.register({
    d = {
      name = "errors",
      ["["] = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", "previous error" },
      ["]"] = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "next error" },
      f = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "quickfix" },
    },
  }, { buffer = 0 })

end

--- Rust analyzer
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      experimental = {
        procAttrMacros = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}

--- Metals
nvim_lsp.metals.setup{
  on_attach = on_attach,
}

--- Pyls
nvim_lsp.pylsp.setup{
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = { exclude = {'E501'} },
      }
    }
  }
}

--- Racket
nvim_lsp.racket_langserver.setup{
  on_attach = on_attach,
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  require('lsp_extensions.workspace.diagnostic').handler, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

" Enable type inlay hints
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }

" ================= UltiSnip ==============
" Disable default mappings for UltiSnips
let g:UltiSnipsListSnippets = "<NUL>"
let g:UltiSnipsExpandTrigger = "<NUL>"

" Use enter to expand snippet
function! SmartEnter()
  if pumvisible() && UltiSnips#CanExpandSnippet()
    return UltiSnips#ExpandSnippet()
  else
    return "\<CR>"
  endif
endfunction
imap <expr> <CR> delimitMate#WithinEmptyPair() ?
             \ "\<Plug>delimitMateCR" :
             \ "\<C-R>=SmartEnter()<CR>"

" Smart tab completion
function! SmartTab()
  if UltiSnips#CanJumpForwards()
    return UltiSnips#JumpForwards()
  elseif pumvisible()
    return "\<C-n>"
  else
    return "\<TAB>"
  endif
endfunction
imap <TAB> <C-R>=SmartTab()<CR>

" Smart shift tab completion
function! SmartSTab()
  if UltiSnips#CanJumpBackwards()
    return UltiSnips#JumpBackwards()
  elseif pumvisible()
    return "\<C-p>"
  else
    return "\<S-TAB>"
  endif
endfunction
imap <S-TAB> <C-R>=SmartSTab()<CR>
