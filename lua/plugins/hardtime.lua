local M = {}

M.plugin = {
	"https://github.com/m4xshen/hardtime.nvim",
	config = function()
		return require("hardtime").setup(M.opts)
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}

M.opts = {}

return M.plugin
