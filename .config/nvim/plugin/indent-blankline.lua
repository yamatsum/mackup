require("indent_blankline").setup {
  filetype_exclude = {"help", "packer", "TelescopePrompt"},
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
    "operation_type"
  }
}
vim.cmd("highlight IndentBlanklineContextChar guifg=#4b5263 gui=nocombine")
