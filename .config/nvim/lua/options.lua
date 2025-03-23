vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.relativenumber = true
vim.opt.number = true
vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })
vim.o.cursorline = true
vim.cmd([[highlight CursorLine guibg=#1e1e2e guifg=NONE]])
