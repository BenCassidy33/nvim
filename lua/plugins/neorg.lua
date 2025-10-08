local M = {}

M.plugin = {
	"https://github.com/nvim-neorg/neorg",
	lazy = false,
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		return require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.summary"] = {},
				["core.concealer"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
			},
		})
	end,
}

return M.plugin
