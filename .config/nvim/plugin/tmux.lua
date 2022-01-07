local map = vim.keymap.set

map("", "<C-w>h", ":lua require'tmux'.move_left()<cr>", { silent = true })
map("", "<C-w>j", ":lua require'tmux'.move_bottom()<cr>", { silent = true })
map("", "<C-w>k", ":lua require'tmux'.move_top()<cr>", { silent = true })
map("", "<C-w>l", ":lua require'tmux'.move_right()<cr>", { silent = true })
