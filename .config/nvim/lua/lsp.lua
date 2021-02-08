vim.cmd("highlight LspDiagnosticsLineNrError guifg=#E06C75 guibg=#4D3840 gui=bold")
vim.cmd("highlight LspDiagnosticsLineNrWarning guifg=#E5C07B guibg=#4E4942 gui=bold")
vim.cmd("highlight LspDiagnosticsLineNrInformation guifg=#98C379 guibg=#3E4941 gui=bold")
vim.cmd("highlight LspDiagnosticsLineNrHint guifg=#61AFEF guibg=#344559 gui=bold")
vim.fn.sign_define("LspDiagnosticsSignError", {numhl = "LspDiagnosticsLineNrError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {numhl = "LspDiagnosticsLineNrWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {numhl = "LspDiagnosticsLineNrInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {numhl = "LspDiagnosticsLineNrHint"})
vim.cmd("autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()")
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    -- virtual_text = false,
    virtual_text = {
      prefix = ""
    },
    signs = true,
    update_in_insert = false
  }
)
