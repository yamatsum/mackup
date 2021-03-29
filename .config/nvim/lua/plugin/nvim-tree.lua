local icons = require "nvim-nonicons"
local opts = {noremap = true, silent = true}
local tree_cb = require "nvim-tree.config".nvim_tree_callback

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_width = 26
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}
vim.g.nvim_tree_icons = {
  default = icons.get("file"),
  folder = {
    default = icons.get("file-directory"),
    open = icons.get("file-directory-outline"),
    symlink = icons.get("file-directory"),
    symlink_open = icons.get("file-directory-outline"),
    empty = icons.get("file-directory-outline"),
    empty_open = icons.get("file-directory-outline")
  }
}
vim.g.nvim_tree_bindings = {
  ["p"] = tree_cb("preview"),
  ["u"] = tree_cb("dir_up")
}
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<CR>", opts)
vim.cmd("autocmd Colorscheme * highlight NvimTreeIndentMarker guifg=#3b4048")
