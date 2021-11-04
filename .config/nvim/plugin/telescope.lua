local map = vim.api.nvim_set_keymap
local map_opts = {noremap = true, silent = true}
local icons = require "nvim-nonicons"

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

map("", "<leader>ff", "<cmd>lua require('telescope.builtin').git_files()<cr>", map_opts)
map("", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", map_opts)
map("", "<leader>fe", "<cmd>lua require('telescope.builtin').file_browser()<cr>", map_opts)
