vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
  default = "",
  folder = {
    -- default = " ",
    default = "",
    -- open = " ",
    open = "",
    symlink = ""
  }
}
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_width = 26
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<CR>", {})
