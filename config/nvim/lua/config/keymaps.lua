local map = vim.keymap.set

map("n", "<C-n>", "<cmd>nohl<CR><C-l>", { desc = "remove highlight" })
map("n", "<leader>w", "<cmd>w<CR>", { desc = "save" })

-- Quickfix
map("n", "<leader>qn", "<cmd>cnext<CR>", { desc = "quickfix next" })
map("n", "<leader>qp", "<cmd>cprev<CR>", { desc = "quickfix prev" })
map("n", "<leader>qo", "<cmd>copen<CR>", { desc = "quickfix open" })
map("n", "<leader>qq", "<cmd>cclose<CR>", { desc = "quickfix close" })

-- Buffers
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "buffer next" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "buffer previous" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "buffer delete" })
map("n", "<leader>bl", "<cmd>Telescope buffers<CR>", { desc = "buffer list" })

-- Git (vim-fugitive)
map("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { desc = "git diff" })
map("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "git blame" })
map("n", "<leader>gm", "<cmd>Git mergetool<CR>", { desc = "git mergetool" })
map("n", "<leader>ga", "<cmd>Git add %<CR>", { desc = "git add" })
map("n", "<leader>gpl", "<cmd>Git pull<CR>", { desc = "git pull" })
map("n", "<leader>gco", "<cmd>Git commit<CR>", { desc = "git commit" })

-- NERD Commenter
map({ "n", "v" }, "<leader>cc", "<Plug>NERDCommenterComment", { desc = "comment" })
map({ "n", "v" }, "<leader>cu", "<Plug>NERDCommenterUncomment", { desc = "uncomment" })
map({ "n", "v" }, "<leader>cm", "<Plug>NERDCommenterMinimal", { desc = "comment minimal" })

-- Telescope
map("n", "<C-P>", "<cmd>Telescope find_files<CR>", { desc = "find files" })
map("n", "<leader>fa", "<cmd>Telescope<CR>", { desc = "all finders" })
map("n", "<leader>ff", "<cmd>Telescope live_grep<CR>", { desc = "live grep" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "help tags" })
map("n", "<leader>fs", "<cmd>Telescope grep_string<CR>", { desc = "grep string" })
map("n", "<leader>fg", "<cmd>Telescope git_status<CR>", { desc = "git status" })
map("n", "<leader>ft", "<cmd>Telescope tags<CR>", { desc = "ctags" })

-- NERDTree
map("n", "<leader>nt", "<cmd>NERDTreeToggle<CR>", { desc = "nerd tree" })

-- lazy.nvim
map("n", "<leader>L", "<cmd>Lazy<CR>", { desc = "lazy plugin manager" })
