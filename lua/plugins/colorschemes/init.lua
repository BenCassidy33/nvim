local M  = {}

M.config = function ()
	require("gruvbox").setup(M.opts)
end

M.opts = {
	terminal_colors = true,
	undercurl = false,
	underline = true,
	bold = true,
	italic = {
		strings = false,
		emphasis = false,
		comments = false,
		operators = false,
		folds = false,
	},

	transparent_mode = true
}


M.plugin = {
	"https://github.com/ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = M.config
}

-- return M.plugin
return {}
