local M = {}

M.plugin = {
	"blazkowolf/gruber-darker.nvim",
	opts = {
		bold = true,
		italic = {
			strings = false,
			comments = false,
		},
	},
}

return M.plugin
