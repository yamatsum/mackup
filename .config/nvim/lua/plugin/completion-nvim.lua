local icons = require "nvim-nonicons"

vim.cmd("autocmd BufEnter * lua require'completion'.on_attach()")
vim.g.completion_enable_snippet = "snippets.nvim"
vim.g.completion_customize_lsp_label = {
  Function = icons.get("package") .. " (function)",
  Method = icons.get("package") .. " (method)",
  Variable = icons.get("variable") .. " (variable)",
  Constant = icons.get("constant") .. " (constant)",
  Struct = icons.get("struct") .. " (struct)",
  Class = icons.get("class") .. " (class)",
  Interface = icons.get("interface") .. " (interface)",
  Text = icons.get("typography") .. " (text)",
  Enum = icons.get("list-unordered") .. " (enum)",
  EnumMember = icons.get("list-unordered") .. " (enum member)",
  Module = "{}(module)",
  Color = icons.get("heart") .. " (color)", -- tmp
  Property = icons.get("tools") .. " (property)",
  Field = icons.get("field") .. " (field)",
  Unit = icons.get("note") .. " (unit)",
  File = icons.get("file") .. " (file)",
  Value = icons.get("note") .. " (value)",
  Event = icons.get("zap") .. " (event)",
  Folder = icons.get("file-directory-outline") .. " (folder)",
  Keyword = icons.get("typography") .. " (keyword)",
  Snippet = icons.get("snippet") .. " (snippet)",
  Operator = icons.get("diff") .. " (operator)",
  Reference = icons.get("file-symlink-file") .. " (reference)",
  TypeParameter = icons.get("type") .. " (type parameter)"
  -- Default = '⍰ (default)',
}
