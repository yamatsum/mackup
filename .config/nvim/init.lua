---------------------------------------------------------------------------
-- Initialize:

local g = vim.g
local o = vim.opt
local c = vim.cmd
local m = vim.api.nvim_set_keymap

c("language en_US")

g.python3_host_prog = vim.env.HOME .. "/.asdf/shims/python"
g.loaded_python_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

---------------------------------------------------------------------------
-- Options:

o.number = true
o.signcolumn = "yes"
o.termguicolors = true
o.shortmess = "IFc"
o.expandtab = true
o.showmode = false
o.fillchars = {eob = " "}
o.pumblend = 10
o.winblend = 10
o.completeopt = "menuone,noinsert,noselect"
o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"
o.mouse = "a"
o.shiftwidth = 2

c("colorscheme one-nvim")

---------------------------------------------------------------------------
-- Mappings:

local map_ops = {noremap = true, silent = true}

g.mapleader = " "
m("i", "<C-j>", "<esc>", map_ops)
m("v", "<C-j>", "<esc>", map_ops)
-- map("", "tt", ":<C-u>tabnew<CR>", map_ops)
m("", "<Tab>", "gt", map_ops)
m("", "<S-Tab>", "gT", map_ops)
m("v", "*", '"zy:let @/ = @z<CR>n', map_ops)

m("n", "<c-]>", ":lua vim.lsp.buf.definition()<CR>", map_ops)
m("n", "K", ":lua vim.lsp.buf.hover()<CR>", map_ops)

---------------------------------------------------------------------------
-- Filetypes:

c("autocmd BufRead,BufNewFile *.prisma set filetype=prisma")
c("autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc")
