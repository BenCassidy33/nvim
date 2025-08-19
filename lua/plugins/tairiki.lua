local M = {}

M.plugin = {
	"https://github.com/deparr/tairiki.nvim",
	config = function()
		return require("tairiki").setup(M.opts)
	end,
}

M.opts = {}

return M.plugin
