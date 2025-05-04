local M = {}

M.plugin = {
	"https://github.com/ggandor/leap.nvim",
	config = function()
		return require("leap").set_default_mappings()
	end
}


return M.plugin
