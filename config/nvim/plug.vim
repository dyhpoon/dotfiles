call plug#begin()
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-surround'
Plug 'numToStr/Comment.nvim', { 'tag': 'v0.6' }
Plug 'jvgrootveld/telescope-zoxide'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'kkharji/sqlite.lua'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'shumphrey/fugitive-gitlab.vim'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

" preferred colorscheme
Plug 'bluz71/vim-nightfly-guicolors'

" file explorer & UIs
Plug 'nvim-tree/nvim-tree.lua'
Plug 'simrat39/symbols-outline.nvim'

" statusline
Plug 'nvim-lualine/lualine.nvim'

" autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'

" snippets
Plug 'L3MON4D3/LuaSnip' " snippet engine
Plug 'saadparwaiz1/cmp_luasnip' " for autocompletion
Plug 'rafamadriz/friendly-snippets' " useful snippets

" managing & installing lsp servers, linters & formatters
Plug 'williamboman/mason.nvim' " in charge of managing lsp servers, linters & formatters
Plug 'williamboman/mason-lspconfig.nvim' " bridges gap b/w mason & lspconfig

" configuring lsp servers
Plug 'neovim/nvim-lspconfig' " easily configure language servers
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' } " enhanced lsp uis
Plug 'onsails/lspkind.nvim' " vs-code like icons for autocompletion

" formatting & linting
Plug 'jose-elias-alvarez/null-ls.nvim' " configure formatters & linters
Plug 'jayp0521/mason-null-ls.nvim' " bridges gap b/w mason & null-ls

" treesitter configuration
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" git integration
Plug 'lewis6991/gitsigns.nvim' " show line modifications on left hand side

" tmux
Plug 'christoomey/vim-tmux-navigator' " tmux & split window navigation

" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" key mapping
Plug 'folke/which-key.nvim'

" rust
Plug 'simrat39/rust-tools.nvim'

call plug#end()

filetype plugin on

