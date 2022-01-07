vim.cmd([[
  highlight DiagnosticLineNrError guifg=#E06C75 guibg=#4D3840 gui=bold
  highlight DiagnosticLineNrWarn guifg=#E5C07B guibg=#4E4942 gui=bold
  highlight DiagnosticLineNrInfo guifg=#98C379 guibg=#3E4941 gui=bold
  highlight DiagnosticLineNrHint guifg=#61AFEF guibg=#344559 gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]])
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  float = {
    border = "rounded",
  },
})
