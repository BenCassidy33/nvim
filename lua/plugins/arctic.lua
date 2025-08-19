local M = {}

M.plugin = {
	"https://github.com/rockyzhang24/arctic.nvim",
	config = function()
		-- return require("arctic").setup(M.opts)
	end,
	dependencies = { "rktjmp/lush.nvim" },
}

M.opts = {}

return M.plugin
