local cmp = require("cmp")

local kind_icons = {
  Text = "",
  Method = "  ",
  Function = "  ",
  Constructor = "",
  Field = "  ",
  Variable = "",
  Class = "  ",
  Interface = "  ",
  Module = "",
  Property = "  ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "  ",
  Snippet = "  ",
  Color = "",
  File = "  ",
  Reference = "  ",
  Folder = "  ",
  EnumMember = "",
  Constant = "",
  Struct = "  ",
  Event = "  ",
  Operator = "",
  TypeParameter = "  ",
}

cmp.setup({
  documentation = {
    border = "rounded",
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
  },
})
