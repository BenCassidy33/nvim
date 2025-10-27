local M = {}

M.plugin = {
	"jesseleite/nvim-noirbuddy",
	dependencies = {
		{ "tjdevries/colorbuddy.nvim" },
	},
	lazy = false,
	priority = 1000,
	opts = M.opts
}

M.opts = {
    preset = "miami-nights"
}

return M.plugin
