local icons = require "nvim-nonicons"

vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_icons = {
  default = icons.get("file"),
  folder = {
    -- default = " ",
    default = icons.get("file-directory"),
    -- open = " ",
    open = icons.get("file-directory-outline"),
    symlink = icons.get("file-directory"),
    empty = icons.get("file-directory-outline"),
    empty_open = icons.get("file-directory-outline")
  }
}
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_width = 26
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap("n", "<C-e>", ":NvimTreeToggle<CR>", opts)
vim.g.nvim_tree_bindings = {
  preview = "p",
  dir_up = "u"
}
vim.cmd("autocmd Colorscheme * highlight NvimTreeIndentMarker guifg=#3b4048")

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
