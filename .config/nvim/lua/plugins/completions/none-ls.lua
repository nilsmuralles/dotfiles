return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        -- lua
				null_ls.builtins.formatting.stylua,
        -- javascript
        null_ls.builtins.formatting.prettier,
        -- python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Get format" })
	end,
}
