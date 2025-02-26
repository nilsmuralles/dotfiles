return {
	"catgoose/nvim-colorizer.lua",
	event = "BufReadPre",
	opts = { -- set to setup table
		filetypes = {
			"css",
			"javascript",
			html = { mode = "foreground" },
		},
	},
	config = function()
    require("colorizer").setup()
		require("colorizer").attach_to_buffer(0, { mode = "background", css = true })
		require("colorizer").detach_from_buffer(0, { mode = "virtualtext", css = true })
	end,
}
