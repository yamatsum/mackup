if vim.g.vscode then
  return
end

local tree_cb = require("nvim-tree.config").nvim_tree_callback
local nonicons_extention = require "nvim-nonicons.extentions.nvim-tree"

vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<CR>", { silent = true })
vim.api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#24292e" })
vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg = "#40474e" })
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end,
})

require("nvim-tree").setup {
  open_on_tab = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  respect_buf_cwd = true,
  git = {
    enable = false,
  },
  view = {
    mappings = {
      list = {
        { key = { "p" }, cb = tree_cb "preview" },
        { key = { "u" }, cb = tree_cb "dir_up" },
        { key = { "o" }, cb = tree_cb "edit" },
        { key = "<Tab>", cb = ":tabnext<CR>" },
        { key = "<C-e>", cb = ":NvimTreeToggle<CR>" },
      },
    },
  },
  renderer = {
    root_folder_modifier = ":t",
    -- group_empty = true,
    icons = {
      padding = "  ",
      glyphs = nonicons_extention.glyphs,
    },
    indent_markers = {
      enable = true,
    },
  },
}
