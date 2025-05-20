local M = {}

M.plugin = {
	"barrett-ruth/live-server.nvim",
	config = function()
		return require("live-server").setup(M.opts)
	end,
}

M.opts = {}

return M.plugin
