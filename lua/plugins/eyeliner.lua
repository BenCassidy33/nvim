local M = {}

M.plugin = {
	"jinh0/eyeliner.nvim",
	config = function()
		require("eyeliner").setup({
			highlight_on_key = true,
			dim = true,
		})
	end,
	-- lazy = true,
}

return M.plugin
