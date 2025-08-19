local M = {}

M.plugin = {
	"https://github.com/sainnhe/gruvbox-material/",
	config = function()
		-- return require("").setup(M.opts)
	end,
	opts = M.opts,
}

M.opts = {
	italic = 0,
}

return M.plugin
