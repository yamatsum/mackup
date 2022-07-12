local tree_cb = require("nvim-tree.config").nvim_tree_callback
local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { silent = true })
vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#24292e" })
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

require("nvim-tree").setup({
  open_on_tab = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  respect_buf_cwd = true,
  git = {
    enable = false,
  },
  view = {
    mappings = {
      list = {
        { key = { "p" }, cb = tree_cb("preview") },
        { key = { "u" }, cb = tree_cb("dir_up") },
        { key = { "o" }, cb = tree_cb("edit") },
        { key = "<Tab>", cb = ":tabNext<CR>" },
      },
    },
  },
  renderer = {
    root_folder_modifier = ":t",
    -- group_empty = true,
    icons = {
      padding = "  ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
      },
      glyphs = nonicons_extention.glyphs,
    },
    -- indent_markers = {
    --   enable = true,
    -- },
  },
})
