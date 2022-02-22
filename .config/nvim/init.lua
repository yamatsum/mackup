local g = vim.g
local o = vim.opt
local cmd = vim.cmd
local map = vim.keymap.set

o.number = true
o.signcolumn = "yes"
o.expandtab = true
o.fillchars = { eob = " " }
o.shortmess = "cFI"
o.clipboard = "unnamedplus"
o.ignorecase = true -- default
o.smartcase = true -- default
o.mouse = "a"
o.shiftwidth = 2
o.updatetime = 250
o.termguicolors = true -- default
o.showmode = false
o.pumblend = 10 -- default
o.winblend = 10 -- default

g.mapleader = " "

map({ "i", "v" }, "<C-j>", "<esc>", { silent = true })
map("", "<Tab>", "gt", { silent = true })
map("", "<S-Tab>", "gT", { silent = true })
map("v", "*", 'y/\\V<C-R>"<CR>', { silent = true })

cmd("lan en_US.UTF-8")
