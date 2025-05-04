local M = {}

M.plugin = {
	"https://github.com/everviolet/nvim",
	name = "everviolet",
	opts = {
		style = {
			tabline = { "reverse" },
			search = { "bold", "reverse" },
			incsearch = { "bold", "reverse" },
			types = { "bold" },
			keyword = { "bold" },
			comment = { "bold" },
		},
		editor = {
			transparent_background = true,
			override_terminal = false,
			sign = {
				color = "surface0",
			},
		},
	},
	config = function() end,
}

return M.plugin
