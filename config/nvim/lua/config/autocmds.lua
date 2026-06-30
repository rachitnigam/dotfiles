local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Map digraph key
vim.keymap.set("i", "<C-q>", "<C-k>")
vim.cmd("digr bt 8869")

vim.filetype.add({
  extension = {
    xdc = "tcl",
  },
})

local set_file_types = augroup("set_file_types", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, { group = set_file_types, pattern = "*.smt", command = "set filetype=lisp" })
autocmd({ "BufRead", "BufNewFile" }, { group = set_file_types, pattern = "*.rkt", command = "set filetype=racket" })
autocmd({ "BufRead", "BufNewFile" }, { group = set_file_types, pattern = "*.html", command = "set filetype=htmlm4" })
autocmd({ "BufRead", "BufNewFile" }, { group = set_file_types, pattern = "*.v", command = "set filetype=verilog" })

-- Disable TeX autoindent
local disable_tex_indent = augroup("disable_tex_indent", { clear = true })
autocmd({ "BufRead", "BufNewFile" }, { group = disable_tex_indent, pattern = "*.tex", command = "filetype indent off" })
autocmd("FileType", {
  group = disable_tex_indent,
  pattern = { "plaintex", "tex", "context" },
  callback = function()
    vim.opt_local.indentexpr = ""
  end,
})
vim.g.tex_flavor = "latex"
vim.g.tex_indent_items = 0
vim.g.tex_indent_brace = 0
vim.g.tex_itemize_env = ""
vim.g.tex_comment_nospell = 1

-- Close preview window once completion is done
autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if vim.fn.pumvisible() == 0 then
      vim.cmd("pclose")
    end
  end,
})

-- Persistent folds/cursor position
local auto_save_folds = augroup("AutoSaveFolds", { clear = true })
autocmd("BufWinLeave", { group = auto_save_folds, pattern = "*.*", command = "mkview" })
autocmd("BufWinEnter", { group = auto_save_folds, pattern = "*.*", command = "silent! loadview" })

autocmd("BufEnter", { pattern = "*", command = "syntax sync fromstart" })

-- Remove trailing whitespace on save
local no_trailing_whitespace = augroup("no_trailing_whitespace", { clear = true })
autocmd("BufWritePre", {
  group = no_trailing_whitespace,
  pattern = "*",
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

-- Enable spell for documents
local spell_hooks = augroup("spell_hooks", { clear = true })
autocmd("FileType", { group = spell_hooks, pattern = { "markdown", "tex" }, command = "set spell" })

vim.keymap.set("n", "<leader>sp", function()
  if vim.fn.exists("*synstack") == 0 then
    return
  end
  local result = vim.fn.map(vim.fn.synstack(vim.fn.line("."), vim.fn.col(".")), 'synIDattr(v:val, "name")')
  print(vim.inspect(result))
end, { desc = "show syntax stack" })
