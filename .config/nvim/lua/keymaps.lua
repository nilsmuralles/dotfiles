-- Leader key = Space
vim.g.mapleader = " "

-- Copy stuff to clipboard
vim.keymap.set({ "n", "v" }, "y", '"+y', { noremap = true, desc = "Yank to system clipboard" })
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

-- Remap macros
vim.keymap.set('n', '<F3>', '@q', { noremap = true, desc = 'Invoke macro easily' })

-- Start live server fast
vim.keymap.set('n', '<leader>lsb', ':LiveServerStart<CR>', { noremap = true, desc = 'Start live server quickly' })

-- Stop live server fast
vim.keymap.set('n', '<leader>lst', ':LiveServerStop<CR>', { noremap = true, desc = 'Stop live server quickly' })

-- Remap escape key in insert and visual mode
vim.keymap.set("i", "<C-j>", "<Esc>", { noremap = true, desc = "Escape with Ctrl+j in insert mode" })
vim.keymap.set("v", "<C-j>", "<Esc>", { noremap = true, desc = "Escape with Ctrl+j in visual mode" })

-- Disabeling some annoying keymaps
vim.keymap.set({ "n", "v" }, "s", "<Nop>", { noremap = true, desc = "Disable s key" })
vim.keymap.set({ "n", "v" }, "<Esc>", "<Nop>", { noremap = true, desc = "Disable escape key" })
