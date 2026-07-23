return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "rust",
      "bash",
      "toml",
      "json",
      "cpp",
      "systemverilog", -- `.v` (filetype `verilog`) maps to this parser upstream
      "go",
      "lua",
      "regex",
      "vim",
      "yaml",
      "python",
    })

    -- native highlighter (`vim.treesitter`); pcall since not every filetype
    -- has an installed parser.
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
