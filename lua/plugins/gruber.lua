local M = {}

M.plugin = {
	"blazkowolf/gruber-darker.nvim",
	config = function()
		require("gruber-darker").setup(M.opts)
		vim.api.nvim_set_hl(0, "@property", { fg = "#ffffff" })
	end,
}

M.opts = {
	bold = true,
	italic = {
		strings = false,
		comments = false,
	},
}

return M.plugin
