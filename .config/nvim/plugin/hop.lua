local map = vim.api.nvim_set_keymap
local map_opts = {noremap = true, silent = true}

require'hop'.setup()
map("n", "s", "<cmd>lua require'hop'.hint_words()<cr>", map_opts)

-- vim.cmd("highlight HopNextKey guifg=red")
-- vim.cmd("highlight HopNextKey1 guifg=#282c34")
-- vim.cmd("highlight HopNextKey2 guifg=red")
