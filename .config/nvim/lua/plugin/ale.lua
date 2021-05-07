vim.g.ale_disable_lsp = 1
vim.g.ale_sign_highlight_linenrs = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_set_highlights = 0
vim.g.ale_linters = {
  typescript = {"eslint"}
}
vim.g.ale_fixers = {
  lua = {"luafmt"},
  typescript = {"prettier"},
  json = {"prettier"}
}
vim.g.ale_lua_luacheck_options = '--globals "vim" "use"'
vim.g.ale_lua_luafmt_options = "-i 2"

vim.cmd("highlight ALEWarningSign guifg=#282c34")
vim.cmd("highlight ALEErrorSign guifg=#282c34")

-- guibg transparency 80%
-- https://github.com/atom/autocomplete-plus/blob/1cd5c49fce80ad28accff2c9707a6e47d9b2d602/styles/autocomplete.less#L220-L221
vim.cmd("highlight ALEErrorSignLineNr guifg=#E06C75 guibg=#4D3840 gui=bold")
vim.cmd("highlight ALEWarningSignLineNr guifg=#E5C07B guibg=#4E4942 gui=bold")
vim.cmd("highlight ALEInfoSignLineNr guifg=#98C379 guibg=#3E4941 gui=bold")
-- blue #
-- magenta #483A55
-- cyan #334650
