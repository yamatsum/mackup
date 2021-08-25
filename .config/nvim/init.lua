---------------------------------------------------------------------------
-- Initialize:

local g = vim.g
local o = vim.opt
local cmd = vim.cmd
local map = vim.api.nvim_set_keymap

cmd("lan en_US.UTF-8")

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
o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"
o.mouse = "a"
o.shiftwidth = 2

cmd("colorscheme one-nvim")

---------------------------------------------------------------------------
-- Mappings:

local map_ops = {noremap = true, silent = true}

g.mapleader = " "
map("i", "<C-j>", "<esc>", map_ops)
map("v", "<C-j>", "<esc>", map_ops)
map("", "<Tab>", "gt", map_ops)
map("", "<S-Tab>", "gT", map_ops)
map("v", "*", 'y/\\V<C-R>"<CR>', map_ops)

map("n", "<c-]>", ":lua vim.lsp.buf.definition()<CR>", map_ops)
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", map_ops)

---------------------------------------------------------------------------
-- Filetypes:

cmd("autocmd BufRead,BufNewFile *.prisma set filetype=prisma")
cmd("autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc")
