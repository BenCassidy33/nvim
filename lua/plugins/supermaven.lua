local M = {}

M.plugin = {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({ M.opts })
	end,
}

M.opts = {
	keymaps = {
		accept_suggestion = "<C-m>",
		clear_suggestion = "<C-]>",
		accept_word = "<C-j>",
	},

	color = {
		suggestion_color = "#ffffff",
		cterm = 244,
	},
}

return M.plugin
