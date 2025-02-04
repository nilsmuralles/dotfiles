require("config.lazy")
require("lazy").setup("plugins")

-- Colorscheme
vim.cmd.colorscheme "catppuccin"

-- Telescope config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })

-- Treesitter configuration
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua"},
	highlight = { enabled = true },
	indent = { enabled = true }
})

-- Configure shortcut for opening Neotree
vim.keymap.set('n', '<C-b>', ':Neotree')

-- Make Lualine start automatically
require('lualine').setup()

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" }
})
require("lspconfig").lua_ls.setup {}
