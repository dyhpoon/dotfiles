-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  print("lspsaga not found!")
  return
end

saga.setup({
  -- use enter to open file with finder
  finder_action_keys = {
    open = "<CR>",
  },
  -- use enter to open file with definition preview
  definition_action_keys = {
    edit = "<CR>",
  },
  symbol_in_winbar = {
    in_custom = true,
    enable = false,
  },
  -- not using outline, replaced by symbols-outline
  show_outline = {
    auto_refresh = false,
    jump_key = "<CR>",
  },
})
