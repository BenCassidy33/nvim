local M = {}

M.plugin = {
	"https://github.com/rafcamlet/nvim-luapad",
	config = function()
		return require("luapad").setup(M.opts)
	end,

	dependencies = {
		"antoinemadec/FixCursorHold.nvim",
	},
}

M.opts = {}

return M.plugin
