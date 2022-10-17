if vim.g.vscode then
  return
end

require("bufferline").setup {
  options = {
    mode = "tabs",
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = { "", "" },
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "NvimTree",
        separator = " ",
      },
    },
  },
}
