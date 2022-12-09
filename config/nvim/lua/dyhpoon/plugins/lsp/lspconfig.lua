-- import lspconfig plugin safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  print("lspconfig not found!")
  return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  print("cmp_nvim_lsp not found!")
  return
end

local rust_tool_status, rust_tools = pcall(require, "rust-tools")
if not rust_tool_status then
  print("rust_tools not found!")
  return
end
rust_tools.setup()

local keymap = vim.keymap -- for conciseness

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- keybind options
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- set keybinds
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

  if client.name == "rust_analyzer" then
    keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, opts)
    keymap.set("n", "<leader>ca", rust_tools.code_action_group.code_action_group, opts)
  end
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

-- configure rust_analyzer server
lspconfig["rust_analyzer"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
