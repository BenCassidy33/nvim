local M = {}

M.plugin = {
	"https://github.com/vague2k/vague.nvim",
	config = function()
		return require("vague").setup(M.opts)
	end,
}

M.opts = {
	transparent = true,
}

return M.plugin
