local M = {}

M.plugin = {
	"https://github.com/folke/lazydev.nvim",
	config = function()
		return require("lazydev").setup(M.opts)
	end,
	ft = "lua",
	opts = M.opts,
}

M.opts = {
	library = {
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	},
}

return M.plugin
