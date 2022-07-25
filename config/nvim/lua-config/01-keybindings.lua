local wk = require("which-key")

--- which key
wk.setup {
  presets = {
    operators = false,
    motions = false,
  },
}

--- Vim bindings
wk.register({
  ["<C-n>"] = { "<cmd>nohl<CR><C-l>", "remove highlight"},
  ["<C-P>"] = { "<cmd>Telescope git_files<CR>", "find files" },
  ["<leader>w"] = { "<cmd>w<CR>", "save" },
  ["<leader>nt"] = { "<cmd>NERDTreeToggle<CR>", "Nerd Tree"},
})

--- Quick fix window
wk.register({
  q = {
    name = "quickfix",
    n = { "<cmd>cnext<CR>", "next" },
    p = { "<cmd>cprev<CR>", "prev" },
    o = { "<cmd>copen<CR>", "open" },
    q = { "<cmd>cclose<CR>", "close" },
  }
}, { prefix = "<leader>" })

--- Plug keys
wk.register({
  p = {
    name = "vim-plug",
    i = { "<cmd>PlugInstall<CR>", "install" },
    c = { "<cmd>PlugClean<CR>", "clean" },
    s = { "<cmd>PlugSnapshot ~/.config/nvim/snapshot.vim<CR>", "snapshot" },
  }
}, { prefix = "<leader>" })

--- Language, non-LSP bindings
wk.register({
  l = {
    name = "language",
    t = { "<cmd>Telescope tags<CR>", "ctags" },
  }
}, { prefix = "<leader>" })

---- Buffers
wk.register({
  b = {
    name = "buffers",
    n = { "<cmd>bnext<CR>", "next" },
    p = { "<cmd>bprevious<CR>", "previous" },
    d = { "<cmd>bdelete<CR>", "delete" },
    l = { "<cmd>Telescope buffers<CR>", "list" },
  }
}, { prefix = "<leader>" })

--- Git commands
wk.register({
  g = {
    name = "git",
    d = { "<cmd>Gdiffsplit<CR>", "diff" },
    b = { "<cmd>Git blame<CR>", "blame" },
    m = { "<cmd>Git mergetool<CR>", "merge tool" },
    a = { "<cmd>Git add %<CR>", "add" },
    pl = { "<cmd>Git pull<CR>", "pull" },
    co = { "<cmd>Git commit<CR>", "commit" },
  },
}, { prefix = "<leader>" })

--- NERD Commenter
local bindings = {
  c = {
    name = "comment",
    c = { "<Plug>NERDCommenterComment", "comment" },
    u = { "<Plug>NERDCommenterUncomment", "uncomment" },
    m = { "<Plug>NERDCommenterMinimal", "minimal" }
  }
}

wk.register(bindings, { mode = "n", prefix = "<leader>"}) -- normal mode
wk.register(bindings, { mode = "v", prefix = "<leader>"}) -- normal mode

--- Telescope
wk.register({
  f = {
    name = "find",
    a = { "<cmd>Telescope<CR>", "all finders" },
    f = { "<cmd>Telescope live_grep<CR>", "live grep" },
    h = { "<cmd>Telescope help_tags<CR>", "help tags" },
    s = { "<cmd>Telescope grep_string<CR>", "grep string" },
    g = { "<cmd>Telescope git_status<CR>", "git status" },
  }
}, { prefix = "<leader>" })

--- Trouble
wk.register({
  t = {
    name = "trouble",
    t = { "<cmd>TroubleToggle<CR>", "open" },
    r = { "<cmd>TroubleRefresh<CR>", "refresh" },
  }
})
