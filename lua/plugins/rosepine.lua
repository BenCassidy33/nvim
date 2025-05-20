local M = {}

M.plugin = {
	"rose-pine/neovim",
	config = function()
		return require("rose-pine").setup(M.opts)
	end,
}

M.opts = {
	dark_variant = "moon",

	enable = {
		terminal = true,
	},

	styles = {
		bold = true,
		italic = false,
		transparency = true,
	},
}

return M.plugin
