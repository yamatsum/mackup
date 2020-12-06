vim.api.nvim_set_keymap('', '<leader>ff', "<cmd>lua require('telescope.builtin').git_files()<cr>", {})
vim.api.nvim_set_keymap('', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})

require('telescope').setup{
  defaults = {
    prompt_position = "top",
    prompt_prefix = "   ",
    sorting_strategy = "ascending",
    winblend = 20,
  }
}
