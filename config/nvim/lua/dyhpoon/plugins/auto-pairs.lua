local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
  print("autopairs not found!")
  return
end

autopairs.setup({})
