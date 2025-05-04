local M = {}

M.plugin = {
	"https://github.com/echasnovski/mini.surround",
	config = function()
		return require("mini.surround").setup(M.opts)
	end,
}

M.opts = {
	mappings = {
		add = "ma",
		delete = "md",
		find = "mf",
		find_left = "mF",
		highlight = "mh",
		replace = "mr",
		update_n_lines = "mn",
	},
}

return M.plugin
