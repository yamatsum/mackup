-- if packer_plugins["nvim-tree.lua"] and packer_plugins["nvim-tree.lua"].loaded then
local icons = require "nvim-nonicons"
local opts = {noremap = true, silent = true}
local tree_cb = require "nvim-tree.config".nvim_tree_callback

vim.g.nvim_tree_root_folder_modifier = ":t"
vim.g.nvim_tree_auto_close = 1
-- vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_width = 26
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1
}
vim.g.nvim_tree_icons = {
  default = icons.get("file"),
  folder = {
    default = icons.get("file-directory"),
    open = icons.get("file-directory-outline"),
    symlink = icons.get("file-directory"),
    symlink_open = icons.get("file-directory-outline"),
    empty = icons.get("file-directory-outline"),
    empty_open = icons.get("file-directory-outline"),
    arrow_open = icons.get("chevron-down"),
    arrow_closed = icons.get("chevron-right")
  }
}
vim.g.nvim_tree_bindings = {
  {key = {"p"}, cb = tree_cb("preview")},
  {key = {"u"}, cb = tree_cb("dir_up")},
  {key = {"o"}, cb = tree_cb("edit")},
  {key = "<Tab>", cb = ":tabNext<CR>"}
}
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<CR>", opts)
vim.cmd("highlight NvimTreeIndentMarker guifg=#3b4048")
vim.cmd("highlight NvimTreeNormal guibg=#21252B guifg=#9da5b3")
vim.cmd("highlight NvimTreeVertSplit guifg=#282c34")

-- end
