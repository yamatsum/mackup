local g = vim.g
local o = vim.opt
local map = vim.keymap.set

o.number = true
o.signcolumn = "yes"
o.expandtab = true
o.fillchars = { eob = " " }
o.shortmess = "oOFI"
o.clipboard = "unnamedplus"
o.ignorecase = true
o.smartcase = true
o.mouse = "a"
o.shiftwidth = 2
o.updatetime = 250
o.pumblend = 10
o.winblend = 10
o.cmdheight = 0

g.mapleader = " "

map({ "i", "v" }, "<C-j>", "<esc>", { silent = true })
map("", "<Tab>", "gt", { silent = true })
map("", "<S-Tab>", "gT", { silent = true })
