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
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
  },
})
