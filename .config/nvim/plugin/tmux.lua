local map = vim.api.nvim_set_keymap
local map_opts = {noremap = true, silent = true}

map("", "<C-w>h", ":lua require'tmux'.move_left()<cr>", map_opts)
map("", "<C-w>j", ":lua require'tmux'.move_bottom()<cr>", map_opts)
map("", "<C-w>k", ":lua require'tmux'.move_top()<cr>", map_opts)
map("", "<C-w>l", ":lua require'tmux'.move_right()<cr>", map_opts)
