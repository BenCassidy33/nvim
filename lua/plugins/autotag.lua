local M = {}

M.plugin = {
	"https://github.com/windwp/nvim-ts-autotag",
	config = function()
		return require("nvim-ts-autotag").setup(M.opts)
	end,

    ft = { "jsx", "tsx" }
}

M.opts = {}

return M.plugin
