-- import neo-tree plugin safely
local setup, neotree = pcall(require, "neo-tree")
if not setup then
  print("neo-tree not found!")
  return
end

-- recommended settings from neo-tree documentation
vim.g.neo_tree_remove_legacy_commands = 1

neotree.setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,

  filesystem = {
    follow_current_file = true,
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_by_name = {
        ".DS_Store",
      },
      never_show = {
        ".DS_Store",
      },
    },
  },

  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      with_markers = true,
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
    git_status = {
      symbols = {
        -- Change type
        added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted = "✖", -- this can only be used in the git_status source
        renamed = "", -- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored = "",
        unstaged = "",
        staged = "",
        conflict = "",
      },
    },
  },
  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = "none",
      ["o"] = "open",
      ["|"] = "open_split",
      ["-"] = "open_vsplit",
    },
  },
})
