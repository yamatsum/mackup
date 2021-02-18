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
vim.g.nvim_tree_bindings = {
  preview = "p",
  dir_up = "u"
}
--[[ 'edit':            ['<CR>', 'o'],
'edit_vsplit':     '<C-v>',
'edit_split':      '<C-x>',
'edit_tab':        '<C-t>',
'close_node':      ['<S-CR>', '<BS>'],
'toggle_ignored':  'I',
'toggle_dotfiles': 'H',
'refresh':         'R',
'preview':         '<Tab>',
'cd':              '<C-]>',
'create':          'a',
'remove':          'd',
'rename':          'r',
'cut':             'x',
'copy':            'c',
'paste':           'p',
'prev_git_item':   '[c',
'next_git_item':   ']c',
'dir_up':          '-',
'close':           'q', ]]
