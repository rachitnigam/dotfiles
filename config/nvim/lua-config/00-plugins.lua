local nvim_lsp = require'lspconfig'

-- Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "rust",
    "bash",
    "toml",
    "json",
    "cpp",
    "verilog",
    "go",
    "lua",
    "regex",
    "vim",
    "yaml",
    "python",
  },
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
    nvim_lsp = {
      priority = 1;
    };
    ultisnips = true;
  };
}

--- Trouble.vim
require('trouble').setup{
  position = "right",
  width = 60,
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
