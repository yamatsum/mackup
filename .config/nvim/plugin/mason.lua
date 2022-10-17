if vim.g.vscode then
  return
end

local nonicons_extention = require "nvim-nonicons.extentions.mason"

require("mason").setup {
  ui = {
    border = "rounded",
    icons = nonicons_extention.icons,
  },
}

require("mason-lspconfig").setup {
  ensure_installed = { "rust_analyzer", "tsserver", "sumneko_lua" },
  automatic_installation = true,
}
