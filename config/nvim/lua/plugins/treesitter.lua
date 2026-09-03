-- nvim-treesitter `main` branch.
--
-- Unlike the old `master` branch, this plugin only *installs* parsers and
-- queries; highlighting, folding and indentation come from Neovim's own
-- tree-sitter runtime and have to be switched on per buffer. There is no
-- `nvim-treesitter.configs` module any more, so no `setup { highlight = ... }`.
--
-- Parsers and queries are installed together and are version-locked to each
-- other, so run `:TSUpdate` after updating the plugin (lazy's `build` does this
-- automatically).

-- Languages to keep installed. Names are parser names, not filetypes.
local languages = {
  "bash",
  "cpp",
  "go",
  "json",
  "lua",
  -- Neovim bundles markdown, but with queries from its own release; install the
  -- pair this plugin's queries were written against.
  "markdown",
  "markdown_inline",
  "python",
  "regex",
  "rust",
  "systemverilog", -- the `verilog` parser was renamed on the main branch
  "toml",
  "vim",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false, -- the main branch does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      -- Parsers and queries land here, prepended to 'runtimepath'.
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Asynchronous, and a no-op for parsers that are already installed.
    ts.install(languages)

    -- The `verilog` filetype maps to a `verilog` parser by default.
    vim.treesitter.language.register("systemverilog", { "verilog", "systemverilog" })

    -- Enable tree-sitter highlighting for any filetype we have a parser for.
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("treesitter_highlight", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if lang and vim.treesitter.language.add(lang) then
          vim.treesitter.start(args.buf, lang)
        end
      end,
    })
  end,
}
