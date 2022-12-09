if vim.g.vscode then
  return
end

local lspconfig = require "lspconfig"
local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, silent = true }
  -- back ctrl-o
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local servers = { "rust_analyzer", "prismals" }
for _, server in ipairs(servers) do
  lspconfig[server].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig["denols"].setup {
  root_dir = lspconfig.util.root_pattern "deno.json",
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    lint = true,
    unstable = true,
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
          ["https://cdn.nest.land"] = true,
          ["https://crux.land"] = true,
        },
      },
    },
  },
}

lspconfig["tsserver"].setup {
  root_dir = lspconfig.util.root_pattern "package.json",
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false },
    },
  },
}

vim.fn.sign_define(
  "DiagnosticSignError",
  { text = "", texthl = "", linehl = "", numhl = "LspDiagnosticsVirtualTextError" }
)
vim.fn.sign_define(
  "DiagnosticSignWarn",
  { text = "", texthl = "", linehl = "", numhl = "LspDiagnosticsVirtualTextWarning" }
)
vim.fn.sign_define(
  "DiagnosticSignInfo",
  { text = "", texthl = "", linehl = "", numhl = "LspDiagnosticsVirtualTextInformation" }
)
vim.fn.sign_define(
  "DiagnosticSignHint",
  { text = "", texthl = "", linehl = "", numhl = "LspDiagnosticsVirtualTextHint" }
)

-- vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true, sp = "#ffffff" })

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
  end,
})

vim.diagnostic.config {
  virtual_text = false,
  -- signs = false,
  -- underline = true,
  float = {
    border = "rounded",
  },
}
