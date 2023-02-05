return {
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      {
        "hrsh7th/cmp-nvim-lsp",
        cond = function()
          -- return require("lazyvim.util").has("nvim-cmp")
        end,
      },
    },
    config = function()
      lspconfig = require('lspconfig')
      cmp_nvim_lsp = require('cmp_nvim_lsp')

      local keymap = vim.keymap
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        keymap.set("n", "<C-space>", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
        keymap.set("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
        keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename

        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show diagnostics for line
        keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
        keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
        keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      -- (not in youtube nvim video)
      local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure html server
      lspconfig["html"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure css server
      lspconfig["cssls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure tailwindcss server
      lspconfig["tailwindcss"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure solargraph server
      lspconfig["solargraph"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure gopls server
      lspconfig["gopls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure pyright server
      lspconfig["pyright"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure lua server (with special settings)
      lspconfig["sumneko_lua"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
    end
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  
  {
    -- bridges gap b/w mason & lspconfig
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "solargraph",
        "gopls",
        "pyright",
        "sumneko_lua",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    },
    dependencies = {
      'williamboman/mason.nvim'
    }
  },

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },

  -- formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      local formatting = nls.builtins.formatting -- to setup formatters
      local diagnostics = nls.builtins.diagnostics -- to setup linters
      local code_actions = nls.builtins.code_actions

      return {
        sources = {
          formatting.stylua, -- lua formatter
          formatting.gofmt,
          formatting.golines,
          diagnostics.golangci_lint,
          code_actions.gitsigns,
        },
        on_attach = function(current_client, bufnr)
          if current_client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({
                  filter = function(client)
                    --  only use null-ls for formatting instead of lsp server
                    return client.name == "null-ls"
                  end,
                  bufnr = bufnr,
                })
              end,
            })
          end
        end,
      }
    end
  },

  {
    'jayp0521/mason-null-ls.nvim',
    opts = {
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "golangci_lint",
        "goimports_reviser",
        "golines",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    },
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim' -- configure formatters & linters
    }
  }
}
