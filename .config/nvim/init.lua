---------------------------------------------------------------------------
-- Initialize:

vim.api.nvim_command("language en_US")
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

---------------------------------------------------------------------------
-- Options:

local o = vim.opt

o.number = true
o.signcolumn = "yes"
o.termguicolors = true
o.shortmess = "IFc"
o.expandtab = true
o.showmode = false
o.fillchars = "eob: "
o.pumblend = 10
o.winblend = 10
o.completeopt = "menuone,noinsert,noselect"
o.ignorecase = true
o.smartcase = true
o.inccommand = "split"
o.clipboard = "unnamedplus"
o.mouse = "a"
o.shiftwidth = 2

vim.cmd("colorscheme one-nvim")

---------------------------------------------------------------------------
-- Mappings:

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

vim.g.mapleader = " "
map("i", "<C-j>", "<esc>", opts)
map("v", "<C-j>", "<esc>", opts)
-- map("", "tt", ":<C-u>tabnew<CR>", opts)
map("", "<Tab>", "gt", opts)
map("", "<S-Tab>", "gT", opts)
map("v", "*", '"zy:let @/ = @z<CR>n', opts)
map("", "<Esc><Esc>", ":nohlsearch<CR>", opts)

map("n", "<c-]>", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)

---------------------------------------------------------------------------
-- Filetypes:

vim.cmd("autocmd BufRead,BufNewFile *.prisma set filetype=prisma")
vim.cmd("autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc")
