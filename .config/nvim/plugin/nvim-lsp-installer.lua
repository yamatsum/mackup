local nonicons_extention = require("nvim-nonicons.extentions.nvim-lsp-installer")

require("nvim-lsp-installer").setup({
  ensure_installed = { "rust_analyzer", "tsserver", "sumneko_lua" },
  automatic_installation = true,
  ui = {
    icons = nonicons_extention.icons,
  },
})
