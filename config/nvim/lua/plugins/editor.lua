return {
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "tpope/vim-fugitive",
  "nvim-tree/nvim-web-devicons",

  {
    "preservim/nerdcommenter",
    init = function()
      vim.g.NERDCreateDefaultMappings = 0
      vim.g.NERDSpaceDelims = 1
    end,
  },

  {
    "Raimondi/delimitMate",
    init = function()
      vim.g.delimitMate_expand_cr = 2
    end,
  },

  {
    "preservim/nerdtree",
    cmd = "NERDTreeToggle",
  },
}
