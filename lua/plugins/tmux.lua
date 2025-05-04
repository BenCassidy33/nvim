local M = {}

M.plugin = {
	"https://github.com/aserowy/tmux.nvim",
	config = function()
		return require("tmux").setup(M.opts)
	end,
}

M.opts = {}

return M.plugin
