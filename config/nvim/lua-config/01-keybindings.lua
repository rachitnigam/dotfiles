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
  ["<C-n>"] = { "<cmd>nohl<CR><C-l>", "remove highlight"}
})

---- Buffers
wk.register({
  b = {
    name = "buffers",
    n = { "<cmd>bnext<CR>", "next" },
    p = { "<cmd>bprevious<CR>", "previous" },
    d = { "<cmd>bdelete<CR>", "delete" },
    l = { "<cmd>buffers<CR>", "list" },
  }
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
  ["<C-P>"] = { "<cmd>Telescope find_files<CR>", "files" },
  f = {
    name = "find",
    a = { "<cmd>Telescope<CR>", "all finders" },
    f = { "<cmd>Telescope live_grep<CR>", "live grep" },
    h = { "<cmd>Telescope help_tags<CR>", "help tags" },
    s = { "<cmd>Telescope grep_string<CR>", "grep string" },
    g = { "<cmd>Telescope git_status<CR>", "git status" },
  }
})

--- Trouble
wk.register({
  t = {
    name = "trouble",
    t = { "<cmd>Trouble<CR>", "open" },
    c = { "<cmd>TroubleClose<CR>", "close" },
    r = { "<cmd>TroubleRefresh<CR>", "refresh" },
  }
})
