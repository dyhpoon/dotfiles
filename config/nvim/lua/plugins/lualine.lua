return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", lazy = true },
  config = function()
    -- get lualine nightfly theme
    local lualine_nightfly = require("lualine.themes.nightfly")
    -- new colors for theme
    local new_colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      black = "#000000",
    }

    -- change nightlfy theme colors
    lualine_nightfly.normal.a.bg = new_colors.blue
    lualine_nightfly.insert.a.bg = new_colors.green
    lualine_nightfly.visual.a.bg = new_colors.violet
    lualine_nightfly.command = {
      a = {
        gui = "bold",
        bg = new_colors.yellow,
        fg = new_colors.black, -- black
      },
    }

    -- configure lualine with modified theme
    require("lualine").setup({
      options = {
        theme = lualine_nightfly,
      },
      extensions = { "neo-tree", "fzf", "fugitive" },
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
      },
    })
  end,
}
