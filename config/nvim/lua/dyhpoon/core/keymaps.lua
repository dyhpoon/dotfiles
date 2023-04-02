-- visual multi --
vim.g.VM_default_mappings = 0

local Util = require("dyhpoon.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

---------------------
-- General Keymaps
---------------------

-- delete single character without copying into register
map("n", "x", '"_x')

-- window management
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- paste
map("v", "<leader>p", '"_dP')

-- open file
map("n", "<leader>oo", "<cmd>silent !open %<cr>", { desc = "Open file" })
map("n", "<leader>oc", "<cmd>silent !open % -a Google\\ Chrome<cr>", { desc = "Open file in Chrome" })
map("n", "<leader>of", "<cmd>silent !open % -a Firefox<cr>", { desc = "Open file in Firefox" })

-- floating terminal
map("n", "<leader>ft", function()
  Util.float_term(nil, { cwd = Util.get_root() })
end, { desc = "Terminal" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Aerial
map("n", "<leader>l", "<cmd>AerialToggle<cr>", { desc = "Skim functions" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- better scroll
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Resize window using <ctrl-alt> arrow keys
map("n", "<C-A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-A-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-A-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- lazygit
map("n", "<leader>gg", function()
  Util.float_term({ "lazygit" }, { cwd = Util.get_root() })
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function()
  Util.float_term({ "lazygit" })
end, { desc = "Lazygit (cwd)" })

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Move Lines
map("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
map("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
map("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Select All
map("n", "<C-a>", "gg<S-v>G")

-- Path
map("n", "cp", ":let @+ = expand('%')<cr>", { desc = "Copy relative path" })
map("n", "cfp", ":let @+ = expand('%:p')<cr>", { desc = "Copy full path" })
map("n", "crp", ":.GBrowse!<cr>", { desc = "Copy remote path" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
