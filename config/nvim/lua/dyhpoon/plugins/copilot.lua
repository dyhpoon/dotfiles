return {
  "github/copilot.vim",
  event = "VeryLazy",
  config = function()
    vim.g.copilot_filetypes = {
      ["chatgpt"] = false,
      ["python"] = true,
      ["lua"] = true,
      ["rust"] = true,
      ["ruby"] = true,
      ["javascript"] = true,
      ["typescript"] = true,
      ["go"] = true,
      ["markdown"] = true,
      ["*"] = false,
    }
  end,
}
