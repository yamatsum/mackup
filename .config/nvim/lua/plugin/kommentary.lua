vim.api.nvim_set_keymap("n", "<C-_><C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_><C-_>", "<Plug>kommentary_visual_default<C-c>", {})
-- require('kommentary.config').configure_language("default", {
--     prefer_single_line_comments = true,
-- })
