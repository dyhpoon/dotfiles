return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)
      function _G.set_terminal_keymaps()
        local options = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], options)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], options)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], options)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], options)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], options)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], options)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], options)
      end
      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
      local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })

      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      function _HTOP_TOGGLE()
        htop:toggle()
      end
    end,
  },
}
