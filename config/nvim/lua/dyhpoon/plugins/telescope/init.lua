local Util = require("dyhpoon.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>,", "<cmd>Telescope resume<cr>", desc = "Telescope Resume" },
      -- find
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", Util.telescope("files"), desc = "Find Files" },
      { "<leader>fF", Util.telescope_find_buffer_files, desc = "Find Files (Buffer)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sg", Util.telescope("live_grep"), desc = "Live Grep" },
      { "<leader>sG", "<cmd>Telescope live_grep_args<cr>", desc = "Live Grep With Args" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sw", Util.telescope("grep_string"), desc = "Word" },
      { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
      {
        "<leader>ss",
        Util.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        Util.telescope("lsp_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol (Workspace)",
      },
    },
    config = function()
      local actions = require("telescope.actions")
      local action_sets = require("telescope.actions.set")
      require("telescope").setup({
        defaults = {
          mappings = {
            n = {
              ["q"] = actions.close,
              ["{"] = function(b)
                action_sets.shift_selection(b, -5)
              end,
              ["}"] = function(b)
                action_sets.shift_selection(b, 5)
              end,
            },
            i = {
              ["<c-t>"] = function(...)
                return require("trouble.providers.telescope").open_with_trouble(...)
              end,
              ["<a-t>"] = function(...)
                return require("trouble.providers.telescope").open_selected_with_trouble(...)
              end,
              ["<a-i>"] = function()
                Util.telescope("find_files", { no_ignore = true })()
              end,
              ["<a-h>"] = function()
                Util.telescope("find_files", { hidden = true })()
              end,
              ["<C-Down>"] = function(...)
                return actions.cycle_history_next(...)
              end,
              ["<C-Up>"] = function(...)
                return actions.cycle_history_prev(...)
              end,
              ["<C-f>"] = function(...)
                return actions.preview_scrolling_down(...)
              end,
              ["<C-b>"] = function(...)
                return actions.preview_scrolling_up(...)
              end,
            },
          },
        },
      })
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },

  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
  },

  {
    "prochri/telescope-all-recent.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "kkharji/sqlite.lua",
    },
    config = function()
      require("telescope-all-recent").setup({})
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    event = "bufWinEnter",
    keys = {
      { "<leader>z", ":lua require('telescope').extensions.projects.projects{}<cr>", desc = "Open projects" },
    },
    config = function()
      require("project_nvim").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
      })
      require("telescope").load_extension("projects")
    end,
  },
}
