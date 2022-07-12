local lspconfig = require("lspconfig")
local hi = vim.api.nvim_set_hl
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  -- back ctrl-o
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local servers = { "rust_analyzer", "tsserver" }
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

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
