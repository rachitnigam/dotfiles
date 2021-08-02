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
  ["<leader>w"] = { "<cmd>w<CR>", "save" }
})

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
    b = { "<cmd>Gblame<CR>", "blame" },
    m = { "<cmd>Git mergetool<CR>", "merge tool" },
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
