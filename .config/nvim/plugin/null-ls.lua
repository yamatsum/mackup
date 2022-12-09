if vim.g.vscode then
  return
end

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua.with {
      extra_args = { "--indent-type", "Spaces", "--indent-width", "2", "--call-parentheses", "None" },
    },
    null_ls.builtins.formatting.prettier.with {
      condition = function(utils)
        return utils.root_has_file { "package.json" }
      end,
    },
    null_ls.builtins.formatting.deno_fmt.with {
      condition = function(utils)
        return utils.root_has_file { "deno.json" }
      end,
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
