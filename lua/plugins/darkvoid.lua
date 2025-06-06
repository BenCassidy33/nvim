local M = {}

M.plugin = {
	"https://github.com/darkvoid-theme/darkvoid.nvim",
	config = function()
		-- return require("").setup(M.opts)
	end,
	lazy = true,
}

M.opts = {}

return M.plugin
