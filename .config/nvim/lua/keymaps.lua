vim.keymap.set("v", "y", '"+y', { noremap = true, desc = "Copy to system clipboard" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.g.mapleader = " "
