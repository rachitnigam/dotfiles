return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
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
      highlight = { enable = true },
    })
  end,
}
