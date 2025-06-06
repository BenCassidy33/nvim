local M = {}

M.plugin = {
	"https://github.com/Shatur/neovim-ayu",
	config = function()
		return require("ayu").setup(M.opts)
	end,
	lazy = true,
}

M.opts = {
	terminal = false,
}

return M.plugin
