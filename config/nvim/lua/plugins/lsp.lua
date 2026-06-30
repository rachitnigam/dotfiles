return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    -- Create buffer local mappings for LSP
    local function on_attach(client, bufnr)
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "<C-]>", vim.lsp.buf.definition, "definition")
      map("n", "K", vim.lsp.buf.hover, "hover")

      map("n", "<leader>lD", vim.lsp.buf.implementation, "implementation")
      map("n", "<leader>lt", vim.lsp.buf.type_definition, "type definition")
      map("n", "<leader>lx", "<cmd>Telescope lsp_references<CR>", "references")
      map("n", "<leader>ls", vim.lsp.buf.document_symbol, "document symbol")
      map("n", "<leader>lw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "workspace symbol")
      map("n", "<leader>ld", vim.lsp.buf.declaration, "declaration")
      map("n", "<leader>la", vim.lsp.buf.code_action, "action")
      map("n", "<leader>lr", vim.lsp.buf.rename, "rename")
      map("n", "<leader>lf", vim.lsp.buf.format, "format")
      map("n", "<leader>le", vim.diagnostic.open_float, "line diagnostic")

      map("n", "d[", vim.diagnostic.goto_prev, "previous error")
      map("n", "d]", vim.diagnostic.goto_next, "next error")
      map("n", "<leader>df", vim.diagnostic.setloclist, "quickfix")
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    }
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local function rust_on_attach(client, bufnr)
      on_attach(client, bufnr)
      if vim.lsp.inlay_hint then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end
    end

    vim.lsp.config("rust_analyzer", {
      on_attach = rust_on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          experimental = {
            procAttrMacros = true,
          },
          check = {
            command = "clippy",
          },
        },
      },
    })
    vim.lsp.enable("rust_analyzer")

    -- To add another language server, follow this pattern:
    -- vim.lsp.config("<server_name>", { on_attach = on_attach, capabilities = capabilities })
    -- vim.lsp.enable("<server_name>")

    vim.diagnostic.config({
      virtual_text = { spacing = 4 },
      signs = true,
      update_in_insert = true,
    })
  end,
}
