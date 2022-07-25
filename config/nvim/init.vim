"Set shell to bash inside vim
set shell=/bin/bash

set nocompatible
filetype on                   " Mac requires this
filetype off                  " required

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
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'

" Github copilot
Plug 'github/copilot.vim'

" Keybindings
Plug 'folke/which-key.nvim'

" Visuals
Plug 'sainnhe/everforest'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/gruvbox-material'
Plug 'lukas-reineke/indent-blankline.nvim'

" Quality of life plugins
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'folke/which-key.nvim'
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
Plug '~/git/filament/tools/vim/filament'
Plug '~/git/calyx/tools/vim/futil'
" Plug '~/git/circt/llvm/mlir/utils/vim/'
" Plug '~/git/circt/llvm/llvm/utils/vim/'

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
