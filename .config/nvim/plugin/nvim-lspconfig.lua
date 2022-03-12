local hi = vim.api.nvim_set_hl

hi(0, "DiagnosticLineNrError", { fg = "#E06C75", bg = "#4D3840", bold = true })
hi(0, "DiagnosticLineNrWarn", { fg = "#E5C07B", bg = "#4E4942", bold = true })
hi(0, "DiagnosticLineNrInfo", { fg = "#98C379", bg = "#3E4941", bold = true })
hi(0, "DiagnosticLineNrHint", { fg = "#61AFEF", bg = "#344559", bold = true })

vim.cmd([[
  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]])

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  float = {
    border = "rounded",
  },
})

-- back ctrl-o
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
