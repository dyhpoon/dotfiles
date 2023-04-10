return {
  {
    "rcarriga/nvim-dap-ui",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    keys = {
      { "<leader>dd", ":lua require'dapui'.toggle()<cr>", desc = "Toggle Debugger" },
      { "<leader>db", ":lua require'dap'.toggle_breakpoint()<cr>", desc = "Create breakpoint" },
      {
        "<leader>dB",
        ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
        desc = "Create conditional breakpoint",
      },
      { "<leader>dc", ":lua require'dap'.continue()<cr>", desc = "Breakpoint continue" },
      { "<leader>di", ":lua require'dap'.step_into()<cr>", desc = "Step into" },
      { "<leader>do", ":lua require'dap'.step_over()<cr>", desc = "Step over" },
      { "<leader>du", ":lua require'dap'.step_out()<cr>", desc = "Step out" },
      { "<leader>dt", ":lua require'dap'.terminate()<cr>", desc = "Terminate" },
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
    config = function()
      require("dap-go").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
