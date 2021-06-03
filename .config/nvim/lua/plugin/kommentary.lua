vim.api.nvim_set_keymap("n", "<C-_><C-_>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<C-_><C-_>", "<Plug>kommentary_visual_default<C-c>", {})
local config = require("kommentary.config")

config.configure_language(
  "default",
  {
    prefer_single_line_comments = true
  }
)
config.configure_language("typescriptreact", {
    hook_function = function()
       pre_comment_hook = require('ts_context_commentstring.internal').update_commentstring()
    end,
    prefer_single_line_comments = true,
})
