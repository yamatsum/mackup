require("indent_blankline").setup({
  filetype_exclude = { "help", "packer", "TelescopePrompt" },
  show_current_context = true,
  context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  },
})
-- TODO
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#2c313a" })
