local lspconfig = require'lspconfig'

vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end

lspconfig.sumneko_lua.setup{}
