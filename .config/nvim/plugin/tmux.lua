local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("", "<C-w>h", ":lua require'tmux'.move_left()<cr>", opts)
vim.api.nvim_set_keymap("", "<C-w>j", ":lua require'tmux'.move_bottom()<cr>", opts)
vim.api.nvim_set_keymap("", "<C-w>k", ":lua require'tmux'.move_top()<cr>", opts)
vim.api.nvim_set_keymap("", "<C-w>l", ":lua require'tmux'.move_right()<cr>", opts)
