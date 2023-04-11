return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      { "<leader>che", "<cmd>GoIfErr<cr>", desc = "GoIfErr - Add if err" },
      { "<leader>cha", "<cmd>GoAddTag<cr>", desc = "GoAddTag - Add tags to struct" },
      { "<leader>chr", "<cmd>GoRMTag<cr>", desc = "GoRMTag - Remove tags to struct" },
      { "<leader>chc", "<cmd>GoCoverage<cr>", desc = "GoCoverage - Test coverage" },
      { "<leader>chg", "<cmd>lua require('go.comment').gen()<cr>", desc = "Generate comment" },
      { "<leader>chv", "<cmd>GoVet<cr>", desc = "GoVet - Go vet" },
      { "<leader>cht", "<cmd>GoModTidy<cr>", desc = "GoModTidy - Go mod tidy" },
      { "<leader>chi", "<cmd>GoModInit<cr>", desc = "GoModInit - Go mod init" },

      { "<leader>chi", "<cmd>GoToggleInlay<cr>", desc = "GoToggleInlay - Toggle inlay" },
      { "<leader>chl", "<cmd>GoLint<cr>", desc = "GoLint - Run linter" },
      { "<leader>cho", "<cmd>GoPkgOutline<cr>", desc = "GoPkgOutline - Outline" },
      { "<leader>chr", "<cmd>GoRun<cr>", desc = "GoRun - Run" },
      { "<leader>chs", "<cmd>GoFillStruct<cr>", desc = "GoFillStruct - Autofill struct" },

      { "<leader>ctn", "<cmd>GoAlt!<cr>", desc = "GoAlt - Open alt file" },
      { "<leader>ct-", "<cmd>GoAltS!<cr>", desc = "GoAltS - Open alt file in split" },
      { "<leader>ct|", "<cmd>GoAltV!<cr>", desc = "GoAltV - Open alt file in vertical split" },

      { "<leader>cta", "<cmd>GoTest<cr>", desc = "GoTest - Run tests" },
      { "<leader>ctf", "<cmd>GoTestFunc<cr>", desc = "GoTestFunc - Run test for current func" },
      { "<leader>ctt", "<cmd>GoTestFile<cr>", desc = "GoTestFile - Run test for current file" },
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
}
