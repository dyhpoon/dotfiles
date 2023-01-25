require("dyhpoon.globals")

require("dyhpoon.core.keymaps")
require("dyhpoon.core.options")
require("dyhpoon.core.colorscheme")

require("dyhpoon.plugins.neo-tree")
require("dyhpoon.plugins.lualine")
require("dyhpoon.plugins.nvim-cmp")
require("dyhpoon.plugins.lsp.mason")
require("dyhpoon.plugins.lsp.lspsaga")
require("dyhpoon.plugins.lsp.lspconfig")
require("dyhpoon.plugins.lsp.null-ls")
require("dyhpoon.plugins.treesitter")
require("dyhpoon.plugins.gitsigns")
require("dyhpoon.plugins.comment")
require("dyhpoon.plugins.auto-pairs")

require("dyhpoon.telescope")

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, "plenary") then
  RELOAD = require("plenary.reload").reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end
