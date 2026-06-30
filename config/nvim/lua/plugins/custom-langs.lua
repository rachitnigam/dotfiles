return {
  { dir = "~/git/dahlia/tools/vim/fuse" },
  { dir = "~/git/calyx/tools/vim/futil" },
  {
    dir = "~/git/claude-filament/tools/vim/filament",
    build = "cd ~/git/claude-filament/tools/treesitter && npm install && npm run build-parser",
    config = function()
      local ok, filament = pcall(require, "filament")
      if ok then
        filament.setup({
          auto_install = false, -- We use locally built parser
          treesitter = {
            highlight = { enable = true },
            indent = { enable = true },
          },
        })
      end
    end,
  },
}
