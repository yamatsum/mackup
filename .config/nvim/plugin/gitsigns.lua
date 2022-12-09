if vim.g.vscode then
  return
end

require("gitsigns").setup {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "" },
    untracked = { text = "▎" },
  },
}
