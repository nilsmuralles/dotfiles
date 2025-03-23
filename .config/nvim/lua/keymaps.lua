vim.keymap.set("v", "y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
vim.keymap.set("n", "yy", '"+yy', { noremap = true, desc = "Yank whole line to system clipboard" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move block upwards" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move block downwards" })
vim.keymap.set('n', '<Tab>', '>>', { noremap = true, desc = 'Indent line' })
vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, desc = 'Unindent line' })
vim.g.mapleader = " "
