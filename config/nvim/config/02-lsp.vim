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
      e = { "<cmd>lua vim.diagnostic.show_line_diagnostic()<CR>", "line diagnostic" },
    },
  }, { prefix = "<leader>", buffer = 0 })

  --- Errors
  wk.register({
    d = {
      name = "errors",
      ["["] = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "previous error" },
      ["]"] = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next error" },
      f = { "<cmd>lua vim.diagnostic.set_loclist()<CR>", "quickfix" },
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
require('cmp_nvim_lsp').update_capabilities(capabilities)

local function rust_on_attach()
  on_attach()
  require'lsp_extensions'.inlay_hints{}
end

nvim_lsp.rust_analyzer.setup {
  on_attach = rust_on_attach,
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

--- nvim-cmp capabilities
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

--- Metals
nvim_lsp.metals.setup{
  on_attach = on_attach,
}

--- Pyls
nvim_lsp.pylsp.setup{
  on_attach = on_attach,
  settings = {
    pylsp = {
      configurationSources = {'flake8'},
    }
  }
}

--- Racket
nvim_lsp.racket_langserver.setup{
  on_attach = on_attach,
}

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { spacing = 4, },
    signs = true,
    update_in_insert = true,
  }
)
EOF
