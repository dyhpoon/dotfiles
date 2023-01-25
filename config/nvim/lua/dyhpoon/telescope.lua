local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")

SHOULD_RELOAD_TELESCOPE = true
local reloader = function()
  if SHOULD_RELOAD_TELESCOPE then
    RELOAD("plenary")
    RELOAD("telescope")
    RELOAD("dyhpoon.telescope")
  end
end

telescope.setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
    },
  },
})

telescope.load_extension("file_browser")
telescope.load_extension("fzf")
telescope.load_extension("zoxide")
telescope.load_extension("frecency")
telescope.load_extension("live_grep_args")

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local M = {}

function M.edit_neovim()
  local opts_with_preview, opts_without_preview

  opts_with_preview = {
    prompt_title = "~ dotfiles ~",
    shorten_path = false,
    cwd = "~/.config/nvim",
    hidden = true,
    sorting_strategy = "ascending",

    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,
      prompt_position = "top",

      horizontal = {
        width = { padding = 0.15 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },

    mappings = {
      i = {
        ["<C-y>"] = false,
      },
    },

    attach_mappings = function(_, map)
      map("i", "<c-y>", set_prompt_to_entry_value)
      map("i", "<M-c>", function(prompt_bufnr)
        actions.close(prompt_bufnr)
        vim.schedule(function()
          require("telescope.builtin").find_files(opts_without_preview)
        end)
      end)

      return true
    end,
  }

  opts_without_preview = vim.deepcopy(opts_with_preview)
  opts_without_preview.previewer = false

  require("telescope.builtin").find_files(opts_with_preview)
end

function M.find_files()
  local opts

  opts = {
    hidden = false,
    sorting_strategy = "ascending",

    layout_strategy = "flex",
    layout_config = {
      prompt_position = "top",
    },

    mappings = {
      i = {
        ["<C-y>"] = false,
      },
    },
  }

  require("telescope.builtin").find_files(opts)
end

function M.find_files_frecency()
  local opts

  opts = {
    hidden = false,
    sorting_strategy = "ascending",

    layout_strategy = "flex",
    layout_config = {
      prompt_position = "top",
    },

    mappings = {
      i = {
        ["<C-y>"] = false,
      },
    },
    workspace = "CWD",
  }

  require("telescope").extensions.frecency.frecency(opts)
end

function M.live_grep()
  local opts

  opts = {
    hidden = false,
    sorting_strategy = "ascending",

    layout_strategy = "flex",
    layout_config = {
      prompt_position = "top",
    },

    mappings = {
      i = {
        ["<C-y>"] = false,
      },
    },
  }

  require("telescope.builtin").live_grep(opts)
end

function M.grep_string()
  local opts

  opts = {
    search = vim.fn.expand("<cword>"),
    hidden = false,
    sorting_strategy = "ascending",

    layout_strategy = "flex",
    layout_config = {
      prompt_position = "top",
    },

    mappings = {
      i = {
        ["<C-y>"] = false,
      },
    },
  }

  require("telescope.builtin").grep_string(opts)
end

function M.git_files()
  local path = vim.fn.expand("%:h")
  if path == "" then
    path = nil
  end

  local width = 0.75
  if path and string.find(path, "sourcegraph.*sourcegraph", 1, false) then
    width = 0.5
  end

  local opts = themes.get_dropdown({
    winblend = 5,
    previewer = false,
    shorten_path = false,

    cwd = path,

    layout_config = {
      width = width,
    },
  })

  require("telescope.builtin").git_files(opts)
end

function M.file_browser()
  local opts

  opts = {
    sorting_strategy = "ascending",
    scroll_strategy = "cycle",
    layout_config = {
      prompt_position = "top",
    },
    path = "%:p:h",

    attach_mappings = function(prompt_bufnr, map)
      local current_picker = action_state.get_current_picker(prompt_bufnr)

      local modify_cwd = function(new_cwd)
        local finder = current_picker.finder

        finder.path = new_cwd
        finder.files = true
        current_picker:refresh(false, { reset_prompt = true })
      end

      map("i", "-", function()
        modify_cwd(current_picker.cwd .. "/..")
      end)

      map("i", "~", function()
        modify_cwd(vim.fn.expand("~"))
      end)

      -- local modify_depth = function(mod)
      --   return function()
      --     opts.depth = opts.depth + mod
      --
      --     current_picker:refresh(false, { reset_prompt = true })
      --   end
      -- end
      --
      -- map("i", "<M-=>", modify_depth(1))
      -- map("i", "<M-+>", modify_depth(-1))

      map("n", "yy", function()
        local entry = action_state.get_selected_entry()
        vim.fn.setreg("+", entry.value)
      end)

      return true
    end,
  }

  require("telescope").extensions.file_browser.file_browser(opts)
end

function M.project_search()
  require("telescope.builtin").find_files({
    previewer = false,
    layout_strategy = "vertical",
    cwd = require("nvim_lsp.util").root_pattern(".git")(vim.fn.expand("%:p")),
  })
end

function M.grep_prompt()
  require("telescope.builtin").grep_string({
    path_display = { "shorten" },
    search = vim.fn.input("Grep String > "),
  })
end

function M.git_branches()
  require("telescope.builtin").git_branches({
    attach_mappings = function(_, map)
      map("i", "<c-d>", actions.git_delete_branch)
      map("n", "<c-d>", actions.git_delete_branch)
      return true
    end,
  })
end

function M.git_status()
  local opts = themes.get_dropdown({
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  })

  -- Can change the git icons using this.
  -- opts.git_icons = {
  --   changed = "M"
  -- }

  require("telescope.builtin").git_status(opts)
end

function M.git_commits()
  require("telescope.builtin").git_commits({
    winblend = 5,
  })
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else
      return require("telescope.builtin")[k]
    end
  end,
})
