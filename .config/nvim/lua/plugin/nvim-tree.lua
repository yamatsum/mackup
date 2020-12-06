vim.g.lua_tree_auto_close = 1
vim.g.lua_tree_icons = {
  default = '   ',
  folder = {
    default = '   ',
    open = '   '
  }
}
vim.g.lua_tree_tab_open = 1
vim.g.lua_tree_width = 26
vim.g.lua_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
  }
vim.api.nvim_set_keymap('', '<C-e>', ':LuaTreeToggle<CR>', {})
