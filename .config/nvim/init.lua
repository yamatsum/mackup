local g = vim.g
local o = vim.opt
local cmd = vim.cmd
local set = vim.keymap.set

o.number = true
o.signcolumn = "yes"
o.termguicolors = true
o.shortmess = "IFc"
o.expandtab = true
o.showmode = false
o.fillchars = { eob = " " }
o.pumblend = 10
o.winblend = 10
o.ignorecase = true
o.smartcase = true
o.clipboard = "unnamedplus"
o.mouse = "a"
o.shiftwidth = 2
o.updatetime = 250

g.mapleader = " "

set({ "i", "v" }, "<C-j>", "<esc>", { silent = true })
set("", "<Tab>", "gt", { silent = true })
set("", "<S-Tab>", "gt", { silent = true })
set("v", "*", 'y/\\V<C-R>"<CR>', { silent = true })

cmd("lan en_US.UTF-8")
cmd("colorscheme one-nvim")
