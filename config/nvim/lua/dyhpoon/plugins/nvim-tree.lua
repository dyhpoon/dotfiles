-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  print("nvim-tree not found!")
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
  -- change folder arrow icons
  renderer = {
    indent_width = 1,
    highlight_opened_files = "name",
    highlight_git = true,
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },

  respect_buf_cwd = false,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  sync_root_with_cwd = true,

  view = {
    adaptive_size = true,
    hide_root_folder = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = "|", action = "vsplit" },
        { key = "-", action = "split" },
      },
    },
  },

  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },

  git = {
    enable = false,
  },
})
