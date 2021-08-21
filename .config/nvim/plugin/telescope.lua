local opts = {noremap = true, silent = true}
local icons = require "nvim-nonicons"

vim.api.nvim_set_keymap("", "<leader>ff", "<cmd>lua require('telescope.builtin').git_files()<cr>", opts)
vim.api.nvim_set_keymap("", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
vim.api.nvim_set_keymap("", "<leader>fe", "<cmd>lua require('telescope.builtin').file_browser()<cr>", opts)

require("telescope").setup {
  defaults = {
    layout_config = {
      prompt_position = "top"
    },
    prompt_prefix = "  " .. icons.get("telescope") .. "  ",
    selection_caret = " ❯ ",
    entry_prefix = "   ",
    sorting_strategy = "ascending",
    winblend = 20
  }
}
