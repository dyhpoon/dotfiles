return {
  'stevearc/aerial.nvim',
  config = function()
    require('aerial').setup({
      keymaps = {
        ["<C-n>"] = "actions.next",
        ["<C-p>"] = "actions.prev",
      },
      close_on_select = true,
    })
  end
}
