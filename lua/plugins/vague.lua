local M = {}

M.plugin = {
	"https://github.com/vague2k/vague.nvim",
	config = function()
		return require("vague").setup(M.opts)
	end,
}

M.opts = {
	transparent = true,
	boolean = "bold",
	number = "none",
	float = "none",
	error = "none",
	comments = "none",
	conditionals = "none",
	functions = "none",
	headings = "bold",
	operators = "none",
	strings = "none",
	variables = "none",
}

return M.plugin
