require("hop").setup()

vim.keymap.set("n", "s", require("hop").hint_words, { silent = true })
