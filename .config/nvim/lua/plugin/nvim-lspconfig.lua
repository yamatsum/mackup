local lspconfig = require'lspconfig'

vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end

lspconfig.sumneko_lua.setup{}
lspconfig.tsserver.setup{}
-- lspconfig.vimls.setup{}
lspconfig.jsonls.setup{}
lspconfig.yamlls.setup{}
