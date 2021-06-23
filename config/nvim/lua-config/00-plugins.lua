local nvim_lsp = require'lspconfig'

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = { enable = true, },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

-- Autocomplete
require'compe'.setup {
  enabled = true;
  documentation = true;
  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    ultisnips = true;
  };
}

-- Lualine configuration
---- Get currently active LSP server
local function get_lsp()
  local msg = 'No LSP'
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then return msg end
  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

require('lualine').setup{
  options = {
    theme = 'gruvbox',
    sources = { 'nvim_lsp' }
  },
  sections = {
    lualine_y = {get_lsp},
    lualine_x = {'diagnostics'},
  }
}

--- Trouble.vim
require('trouble').setup{
  position = "right",
  width = 80,
  actions_keys = {
    previous = "d[", -- preview item
    next = "d]" -- next item
  }
}

--- Telescope
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    preview_cutoff = 15,
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}
