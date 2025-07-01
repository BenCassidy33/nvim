local M = {}

M.plugin = {
	"vague2k/vague.nvim",
	config = function()
		return require("vague").setup(M.opts)
	end,
}

M.opts = {
	italic = false,
	bold = true,
	transparent = true,
}

return M.plugin
