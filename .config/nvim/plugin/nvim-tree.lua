local icons = require("nvim-nonicons")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_root_folder_modifier = ":t"
-- vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}
vim.g.nvim_tree_respect_buf_cwd = 1
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
    arrow_closed = icons.get("chevron-right"),
  },
}
vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { silent = true })
vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#24292e" })

require("nvim-tree").setup({
  open_on_tab = true,
  auto_close = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    width = 26,
    mappings = {
      list = {
        { key = { "p" }, cb = tree_cb("preview") },
        { key = { "u" }, cb = tree_cb("dir_up") },
        { key = { "o" }, cb = tree_cb("edit") },
        { key = "<Tab>", cb = ":tabNext<CR>" },
      },
    },
  },
})
