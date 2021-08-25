local cmp = require("cmp")

cmp.setup {
  documentation = {
    border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm(
      {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true
      }
    )
  },
  sources = {
    {name = "buffer"},
    {name = "nvim_lua"},
    {name = "nvim_lsp"}
  }
}
