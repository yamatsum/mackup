local map = vim.keymap.set
local config = require("kommentary.config")

map("n", "<C-_>", "<Plug>kommentary_line_default", { silent = true })
map("v", "<C-_>", "<Plug>kommentary_visual_default<C-c>", { silent = true })

config.configure_language("default", {
  prefer_single_line_comments = true,
})

config.configure_language("typescriptreact", {
  single_line_comment_string = "auto",
  multi_line_comment_strings = "auto",
  hook_function = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
