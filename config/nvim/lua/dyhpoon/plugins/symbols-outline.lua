-- import symbols-outline safely
local so_status, so = pcall(require, "symbols-outline")
if not so_status then
  print("symbols-outline not found!")
  return
end

so.setup({
  width = 35,
  show_numbers = true,
  show_relative_numbers = true,
})
