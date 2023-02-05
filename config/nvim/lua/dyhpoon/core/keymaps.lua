-- visual multi --
vim.g.VM_default_mappings = 0

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- better scroll
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Resize window using <ctrl-alt> arrow keys
keymap.set("n", "<C-A-k>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<C-A-j>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<C-A-l>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<C-A-h>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- better up/down
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- quit
keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- save file
keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Move Lines
keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- Select All
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Path
keymap.set("n", "cp", ":let @+ = expand('%')<cr>", { desc = "Copy relative path" })
keymap.set("n", "cfp", ":let @+ = expand('%:p')<cr>", { desc = "Copy full path" })
keymap.set("n", "crp", ":.GBrowse!<cr>", { desc = "Copy remote path" })

----------------------
-- Plugin Keybinds
----------------------

-- neo-tree
keymap.set("n", "<leader>b", ":Neotree toggle<CR>") -- toggle file explorer
