local nvim_lsp = require'lspconfig'

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = { enable = true, },
}

-- Autocomplete
require'compe'.setup {
  enabled = true;
  documentation = {
    min_width = 30,
  },
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
    lualine_y = {},
    lualine_x = {{
      'diagnostics',
      color_warn = 'EED202',
    }},
    lualine_c = {{
      'filename',
      status = true,
      path = 1,
    }},
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
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        preview_height = 0.3,
      }
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        },
        n = {
          ["<c-d>"] = require("telescope.actions").delete_buffer,
        }
      }
    },
  },
}
