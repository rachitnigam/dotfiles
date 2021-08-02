"Set shell to bash inside vim
set shell=/bin/bash

set nocompatible
filetype on                   " Mac requires this
filetype off                  " required

call plug#begin('~/.local/share/nvim/plugged-new')

" FZF for quick file jumps
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
Plug 'hrsh7th/nvim-compe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Keybindings
Plug 'folke/which-key.nvim'

" Visuals
Plug 'sainnhe/everforest'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'

" Quality of life plugins
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'folke/which-key.nvim'
Plug 'Raimondi/delimitMate'
Plug 'gregsexton/MatchTag'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

" Language plugins
Plug '~/git/calyx/tools/vim/futil'
Plug '~/git/dahlia/tools/vim'

call plug#end()

" Execute the vim commands before anything
" execute 'source ~/.config/nvim/vim_settings.vim'
for filename in sort(split(glob('~/.config/nvim/config/*.vim'), '\n'))
  execute 'source '.filename
endfor

for filename in sort(split(glob('~/.config/nvim/lua-config/*.lua'), '\n'))
  execute 'luafile '.filename
endfor

set runtimepath +=~/.config/nvim/config/
set runtimepath +=~/.config/nvim/lua-config/
