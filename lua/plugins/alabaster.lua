local M = {}

M.plugin = {
	"https://github.com/p00f/alabaster.nvim",
	config = function()
		-- return require("").setup(M.opts)
	end,
	lazy = true,
}

M.opts = {}

return M.plugin
