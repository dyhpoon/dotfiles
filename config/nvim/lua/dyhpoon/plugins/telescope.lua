return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = "Telescope",
    version = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local actions = require("telescope.actions")
      require('telescope').setup({
        defaults = {
          mappings = {
            n = {
              ["q"] = actions.close,
            },
          },
        },
      })
    end
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require('telescope').load_extension('fzf')
    end
  },

  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end
  },

  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'kkharji/sqlite.lua',
    },
    config = function()
      require"telescope".load_extension("frecency")
    end
  },

  {
    'jvgrootveld/telescope-zoxide',
    keys = {
      { "<leader>z", ":lua require('telescope').extensions.zoxide.list{}<cr>", desc = "Open projects" },
    },
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require("telescope").load_extension('zoxide')
    end
  }
}
