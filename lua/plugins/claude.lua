local M = {}

M.plugin = {
	"https://github.com/greggh/claude-code.nvim",
	config = function()
		return require("claude-code").setup(M.opts)
	end,

	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},

	enabled = false,
}

M.opts = {
	window = {
		split_ratio = 0.3,
		position = "botright",
	},
}

return M.plugin
