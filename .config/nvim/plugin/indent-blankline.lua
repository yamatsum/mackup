require("indent_blankline").setup({
  filetype_exclude = { "help", "packer", "TelescopePrompt" },
  show_current_context = true,
})
-- TODO
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#61AFEF" })
