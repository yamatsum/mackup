local map = vim.api.nvim_set_keymap
local map_opts = {silent = true}
local config = require("kommentary.config")

map("n", "<C-_><C-_>", "<Plug>kommentary_line_default", map_opts)
map("v", "<C-_><C-_>", "<Plug>kommentary_visual_default<C-c>", map_opts)

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
