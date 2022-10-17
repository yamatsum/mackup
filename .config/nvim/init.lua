local o = vim.o
local g = vim.g
local map = vim.keymap.set

o.number = true
o.signcolumn = "yes"
o.expandtab = true
o.clipboard = "unnamedplus"
o.ignorecase = true
o.smartcase = true
o.shiftwidth = 2
o.updatetime = 250
o.pumblend = 10
o.winblend = 10
o.cmdheight = 0

g.mapleader = " "

map({ "i", "v" }, "<C-j>", "<esc>")
map("n", "<Tab>", "gt")
map("n", "<S-Tab>", "gT")
