local wk = require("which-key")

--- which key
wk.setup {
  preset = "modern",
  spec = {}
}

--- Vim bindings
wk.add({
  { "<C-n>", "<cmd>nohl<CR><C-l>", desc = "remove highlight" },
  { "<C-P>", "<cmd>Telescope git_files<CR>", desc = "find files" },
  { "<leader>w", "<cmd>w<CR>", desc = "save" },
  { "<leader>nt", "<cmd>NERDTreeToggle<CR>", desc = "Nerd Tree" },
})

--- Quick fix window
wk.add({
  { "<leader>q", group = "quickfix" },
  { "<leader>qn", "<cmd>cnext<CR>", desc = "next" },
  { "<leader>qp", "<cmd>cprev<CR>", desc = "prev" },
  { "<leader>qo", "<cmd>copen<CR>", desc = "open" },
  { "<leader>qq", "<cmd>cclose<CR>", desc = "close" },
})

--- Plug keys
wk.add({
  { "<leader>p", group = "vim-plug" },
  { "<leader>pi", "<cmd>PlugInstall<CR>", desc = "install" },
  { "<leader>pc", "<cmd>PlugClean<CR>", desc = "clean" },
  { "<leader>ps", "<cmd>PlugSnapshot ~/.config/nvim/snapshot.vim<CR>", desc = "take snapshot" },
  { "<leader>pl", "<cmd>so ~/.config/nvim/snapshot.vim<CR>", desc = "load snapshot" },
})

--- Language, non-LSP bindings
wk.add({
  { "<leader>l", group = "language" },
  { "<leader>lt", "<cmd>Telescope tags<CR>", desc = "ctags" },
})

---- Buffers
wk.add({
  { "<leader>b", group = "buffers" },
  { "<leader>bn", "<cmd>bnext<CR>", desc = "next" },
  { "<leader>bp", "<cmd>bprevious<CR>", desc = "previous" },
  { "<leader>bd", "<cmd>bdelete<CR>", desc = "delete" },
  { "<leader>bl", "<cmd>Telescope buffers<CR>", desc = "list" },
})

--- Git commands
wk.add({
  { "<leader>g", group = "git" },
  { "<leader>gd", "<cmd>Gdiffsplit<CR>", desc = "diff" },
  { "<leader>gb", "<cmd>Git blame<CR>", desc = "blame" },
  { "<leader>gm", "<cmd>Git mergetool<CR>", desc = "merge tool" },
  { "<leader>ga", "<cmd>Git add %<CR>", desc = "add" },
  { "<leader>gpl", "<cmd>Git pull<CR>", desc = "pull" },
  { "<leader>gco", "<cmd>Git commit<CR>", desc = "commit" },
})

--- NERD Commenter
wk.add({
  { "<leader>c", group = "comment", mode = { "n", "v" } },
  { "<leader>cc", "<Plug>NERDCommenterComment", desc = "comment", mode = { "n", "v" } },
  { "<leader>cu", "<Plug>NERDCommenterUncomment", desc = "uncomment", mode = { "n", "v" } },
  { "<leader>cm", "<Plug>NERDCommenterMinimal", desc = "minimal", mode = { "n", "v" } },
})

--- Telescope
wk.add({
  { "<leader>f", group = "find" },
  { "<leader>fa", "<cmd>Telescope<CR>", desc = "all finders" },
  { "<leader>ff", "<cmd>Telescope live_grep<CR>", desc = "live grep" },
  { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "help tags" },
  { "<leader>fs", "<cmd>Telescope grep_string<CR>", desc = "grep string" },
  { "<leader>fg", "<cmd>Telescope git_status<CR>", desc = "git status" },
})

--- Trouble
wk.add({
  { "<leader>t", group = "trouble" },
  { "<leader>tt", "<cmd>TroubleToggle<CR>", desc = "open" },
  { "<leader>tr", "<cmd>TroubleRefresh<CR>", desc = "refresh" },
})