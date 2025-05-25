local M = {}

M.plugin = {
	"https://github.com/olrtg/nvim-emmet",
	config = function()
		-- return require("nvim-emmet").setup(M.opts)
	end,
}

M.opts = {}

return M.plugin
