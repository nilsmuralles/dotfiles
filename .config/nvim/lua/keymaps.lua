-- Leader key = Space
vim.g.mapleader = " "

-- Copy stuff to clipboard
vim.keymap.set("v", "y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
vim.keymap.set("n", "yy", '"+yy', { noremap = true, desc = "Yank whole line to system clipboard" })
-- Move around blocks of code
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move block upwards" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move block downwards" })
-- Indentations
vim.keymap.set('n', '<Tab>', '>>', { noremap = true, desc = 'Indent line' })
vim.keymap.set('n', '<S-Tab>', '<<', { noremap = true, desc = 'Unindent line' })
vim.keymap.set('v', '<Tab>', '>gv', { noremap = true, desc = 'Indent selected lines' } )
vim.keymap.set('v', '<S-Tab>', '<gv', { noremap = true, desc = 'Indent selected lines' } )
-- Remap visual line mode for comfort
vim.keymap.set('n', 'vv', 'V', { noremap = true, desc = 'Enter Visual Line mode' })
-- Quick save
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, desc = 'Quick save files' })
