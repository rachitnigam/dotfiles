local nvim_lsp = require'lspconfig'
local wk = require("which-key")

--- Create buffer local mappings for LSP
local function on_attach(client, bufnr)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", {})

  --- Top bindings
  wk.add({
    { "<C-]>", desc = "definition", buffer = bufnr },
    { "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "hover", buffer = bufnr },
  })

  --- LSP
  wk.add({
    { "<leader>l", group = "language", buffer = bufnr },
    { "<leader>lD", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "implementation", buffer = bufnr },
    { "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "type definition", buffer = bufnr },
    { "<leader>lx", "<cmd>Telescope lsp_references<CR>", desc = "references", buffer = bufnr },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", desc = "document symbol", buffer = bufnr },
    { "<leader>lw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", desc = "workspace symbol", buffer = bufnr },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "declaration", buffer = bufnr },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "action", buffer = bufnr },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "rename", buffer = bufnr },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "format", buffer = bufnr },
    { "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "line diagnostic", buffer = bufnr },
  })

  --- Errors
  wk.add({
    { "d[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "previous error", buffer = bufnr },
    { "d]", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "next error", buffer = bufnr },
    { "<leader>df", "<cmd>lua vim.diagnostic.setloclist()<CR>", desc = "quickfix", buffer = bufnr },
  })
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
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local function rust_on_attach(client, bufnr)
  on_attach(client, bufnr)
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
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

--- Metals
nvim_lsp.metals.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

--- Pyls
-- nvim_lsp.pylsp.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     pylsp = {
--       configurationSources = {'flake8'},
--     }
--   }
-- }

--- Racket
-- nvim_lsp.racket_langserver.setup{
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

--- Clangd
-- nvim_lsp.clangd.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- Enable diagnostics
vim.diagnostic.config({
  virtual_text = { spacing = 4, },
  signs = true,
  update_in_insert = true,
})
