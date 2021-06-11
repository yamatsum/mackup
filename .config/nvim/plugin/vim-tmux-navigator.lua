local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("", "<C-w>h", ":TmuxNavigateLeft<cr>", opts)
vim.api.nvim_set_keymap("", "<C-w>j", ":TmuxNavigateDown<cr>", opts)
vim.api.nvim_set_keymap("", "<C-w>k", ":TmuxNavigateUp<cr>", opts)
vim.api.nvim_set_keymap("", "<C-w>l", ":TmuxNavigateRight<cr>", opts)
