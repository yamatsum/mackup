local ok, _ = pcall(require, "colorizer")
if not ok or vim.g.vscode then
  return
end

require("colorizer").setup()
