local M = {}

M.plugin = {
	"https://github.com/xiyaowong/transparent.nvim",
	config = function()
		return require("transparent").setup(M.opts)
	end,
}

M.opts = {
	exclude_groups = { "Pmenu", "PmenuSel", "NormalFloat" },
}

return M.plugin
