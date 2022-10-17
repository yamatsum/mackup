if vim.g.vscode then
  return
end

local cmp = require "cmp"
local util = require "github-theme.util"
local p = require("github-theme.palette").get_palette "dark"

local palette = {
  variable = { bg = util.darken(p.syntax.variable, 0.2, p.bg2), fg = p.syntax.variable, bold = true },
  keyword = { bg = util.darken(p.syntax.keyword, 0.2, p.bg2), fg = p.syntax.keyword, bold = true },
  file = { bg = util.darken(p.orange, 0.2, p.bg2), fg = p.orange, bold = true },
  func = { bg = util.darken(p.syntax.func, 0.2, p.bg2), fg = p.syntax.func, bold = true },
  constant = { bg = util.darken(p.syntax.constant, 0.2, p.bg2), fg = p.syntax.constant, bold = true },
}

vim.api.nvim_set_hl(0, "CmpItemKindVariable", palette.variable)
vim.api.nvim_set_hl(0, "CmpItemKindClass", palette.variable)
vim.api.nvim_set_hl(0, "CmpItemKindEnum", palette.variable)
vim.api.nvim_set_hl(0, "CmpItemKindInterface", palette.variable)
vim.api.nvim_set_hl(0, "CmpItemKindText", palette.variable)

vim.api.nvim_set_hl(0, "CmpItemKindKeyword", palette.keyword)
vim.api.nvim_set_hl(0, "CmpItemKindField", palette.keyword)
vim.api.nvim_set_hl(0, "CmpItemKindUnit", palette.keyword)
vim.api.nvim_set_hl(0, "CmpItemKindValue", palette.keyword)

vim.api.nvim_set_hl(0, "CmpItemKindFile", palette.file)
vim.api.nvim_set_hl(0, "CmpItemKindFolder", palette.file)

vim.api.nvim_set_hl(0, "CmpItemKindFunction", palette.func)
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", palette.func)
vim.api.nvim_set_hl(0, "CmpItemKindEvent", palette.func)
vim.api.nvim_set_hl(0, "CmpItemKindMethod", palette.func)

vim.api.nvim_set_hl(0, "CmpItemKindOperator", palette.keyword)
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", palette.keyword)
vim.api.nvim_set_hl(0, "CmpItemKindReference", palette.keyword)
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", palette.keyword)

vim.api.nvim_set_hl(0, "CmpItemKindConstant", palette.constant)
vim.api.nvim_set_hl(0, "CmpItemKindModule", palette.constant)
vim.api.nvim_set_hl(0, "CmpItemKindStruct", palette.constant)
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", palette.constant)

local kind_icons = {
  Text = " ",
  Method = " ",
  Function = " ",
  Constructor = " ",
  Field = " ",
  Variable = " ",
  Class = " ",
  Interface = " ",
  Module = "  ",
  Property = " ",
  Unit = "  ",
  Value = "  ",
  Enum = "  ",
  Keyword = " ",
  Snippet = " ",
  Color = " ",
  File = " ",
  Reference = " ",
  Folder = " ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = " ",
  Event = " ",
  Operator = " ",
  TypeParameter = " ",
}

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = function(_entry, vim_item)
      -- vim_item.kind = string.format(" %s ", kind_icons[vim_item.kind])
      vim_item.kind = string.format(" %s ", string.lower(string.sub(vim_item.kind, 1, 1)))
      return vim_item
    end,
  },
  window = {
    documentation = {
      border = "rounded",
    },
    -- completion = {
    --   border = "rounded",
    -- },
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  mapping = cmp.mapping.preset.insert {
    ["<CR>"] = cmp.mapping.confirm { select = true },
    -- ["<C-n>"] = cmp.mapping.select_next_item(),
    -- ["<C-p>"] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
  },
}

cmp.setup.cmdline(":", {
  completion = {
    keyword_length = 3,
  },
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "cmdline" },
  },
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})
