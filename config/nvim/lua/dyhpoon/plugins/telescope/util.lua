local telescope = require("telescope")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

--[[
" lua require("dyhpoon")
nnoremap <silent> ;b <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;; <cmd>Telescope help_tags<cr>

" Dotfile
nnoremap <leader>en :lua require('dyhpoon.telescope').edit_neovim()<CR>

" Files
" nnoremap <C-p> :lua require('telescope.builtin').git_files({ layout_config = { prompt_position = "top" }, sorting_strategy = "ascending" })<CR>
" nnoremap <Leader>ff :lua require('dyhpoon.telescope').find_files()<CR>
nnoremap <Leader>ff :lua require('dyhpoon.telescope').find_files_frecency()<CR>
nnoremap <Leader>fg :lua require('dyhpoon.telescope').live_grep()<CR>
nnoremap <Leader>fG :lua require('telescope').extensions.live_grep_args.live_grep_args()<CR> 
nnoremap <leader>fw :lua require('dyhpoon.telescope').grep_string()<CR>

" Git
nnoremap <Leader>gs :lua require('dyhpoon.telescope').git_status()<CR>
nnoremap <Leader>gc :lua require('dyhpoon.telescope').git_commits()<CR>
nnoremap <leader>gb :lua require('dyhpoon.telescope').git_branches()<CR>
nmap <leader>ga :G<CR>

" Nvim
nnoremap <Leader>fh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<CR>
nnoremap <Leader>gp :lua require('dyhpoon.telescope').grep_prompt()<CR>
--]]

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
    if M[k] then
      return M[k]
    else
      return require("telescope.builtin")[k]
    end
  end,
})
