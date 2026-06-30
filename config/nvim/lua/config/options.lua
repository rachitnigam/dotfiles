local opt = vim.opt

-- Indent using 2 space characters
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.foldmethod = "indent"
opt.foldlevelstart = 99

vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

if vim.fn.has("termguicolors") == 1 then
  opt.termguicolors = true
end

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

-- Display
opt.cursorline = true
opt.showmatch = true
opt.linebreak = true
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.showcmd = true
opt.colorcolumn = "80"
opt.list = true
opt.listchars = { tab = "!▸", trail = "·" }
opt.signcolumn = "yes"
opt.lazyredraw = true

opt.backspace = { "indent", "eol", "start" }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Persistent undo / view (fold, cursor) state
opt.undofile = true
opt.viewoptions = { "folds", "cursor" }

opt.inccommand = "nosplit"
opt.modeline = true
opt.modelineexpr = true
opt.hidden = true

-- Completion
-- menuone: popup even when there's only one match
-- noinsert: do not insert text until a selection is made
-- noselect: do not select, force user to select one from the menu
opt.completeopt = { "menuone", "noinsert", "noselect" }
opt.shortmess:append("c")
opt.pumheight = 12

-- Command-line completion
opt.wildmenu = true
opt.wildmode = { "longest:full", "full" }
opt.wildoptions = "pum"

opt.previewheight = 1

-- Use silver searcher if present
if vim.fn.executable("ag") == 1 then
  opt.grepprg = "ag --nogroup --nocolor"
end

vim.cmd("highlight SpellBad cterm=underline ctermfg=red")
