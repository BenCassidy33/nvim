local M = {}

M.plugin = {
	"https://github.com/supermaven-inc/supermaven-nvim",
	config = function()
		return require("supermaven-nvim").setup(M.opts)
	end,
}

M.opts = {
	keymaps = {
		accept_suggestion = "<Tab>",
		clear_suggestion = "<C-]>",
	},

	ignore_filetypes = { markdown = true, typst = true, plaintext = true },
}

return M.plugin
