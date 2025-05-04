local M = {}

M.plugin = {
	"https://github.com/yorik1984/newpaper.nvim",
	name = "word",
	config = function()
		-- return require("newpaper").setup(M.opts)
	end,
}

M.opts = {}

return M.plugin
