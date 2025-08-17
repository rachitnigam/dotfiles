-- Set shell to bash inside vim
vim.o.shell = '/bin/bash'

vim.o.compatible = false
vim.cmd('filetype on')  -- Mac requires this
vim.cmd('filetype off') -- required

-- Plugin installation using vim-plug
vim.cmd([[
call plug#begin('~/.local/share/nvim/plugged')

" Telescope picker
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Treesitter configuration
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'folke/trouble.nvim'

" Autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

" Github copilot
" Plug 'github/copilot.vim'

" Keybindings
Plug 'folke/which-key.nvim'

" Visuals
" Plug 'sainnhe/everforest'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'lukas-reineke/indent-blankline.nvim'

" Quality of life plugins
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" Language plugins
Plug 'pest-parser/pest.vim'
Plug 'wlangstroth/vim-racket'
Plug 'psosera/ott-vim'
Plug 'rhysd/vim-llvm'
Plug '~/git/dahlia/tools/vim/fuse'
Plug '~/git/claude-filament/tools/vim/filament', {'do': 'cd ~/git/claude-filament/tools/treesitter && npm install && npm run build-parser'}
Plug '~/git/calyx/tools/vim/futil'

call plug#end()
]])

-- Load all vim configuration files
local config_path = vim.fn.expand('~/.config/nvim/config')
local vim_files = vim.fn.glob(config_path .. '/*.vim', false, true)
table.sort(vim_files)
for _, file in ipairs(vim_files) do
    vim.cmd('source ' .. file)
end

-- Load all lua configuration files
local lua_config_path = vim.fn.expand('~/.config/nvim/lua')
package.path = package.path .. ';' .. lua_config_path .. '/?.lua'

-- Load lua modules automatically
local lua_config_path = vim.fn.expand('~/.config/nvim/lua')
local lua_files = vim.fn.glob(lua_config_path .. '/*.lua', false, true)
table.sort(lua_files)
for _, file in ipairs(lua_files) do
    local module_name = vim.fn.fnamemodify(file, ':t:r')
    require(module_name)
end

-- Old manual requires
-- require('plugins')
-- require('keybindings')
-- require('lsp-config')
-- require('settings')

-- Add runtime paths
vim.o.runtimepath = vim.o.runtimepath .. ',' .. config_path
vim.o.runtimepath = vim.o.runtimepath .. ',' .. lua_config_path
