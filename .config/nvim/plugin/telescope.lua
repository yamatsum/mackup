if vim.g.vscode then
  return
end

local map = vim.keymap.set
local icons = require "nvim-nonicons"

require("telescope").setup {
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    prompt_prefix = "  " .. icons.get "telescope" .. "  ",
    selection_caret = " ❯ ",
    entry_prefix = "   ",
    sorting_strategy = "ascending",
    winblend = 20,
  },
}

map("", "<leader>ff", require("telescope.builtin").git_files, { silent = true })
map("", "<leader>fg", require("telescope.builtin").live_grep, { silent = true })
