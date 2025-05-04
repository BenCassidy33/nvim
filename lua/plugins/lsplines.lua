local M = {}

M.plugin = {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	config = function()
		vim.diagnostic.config({
			virtual_text = false,
		})
		return require("lsp_lines").setup(M.opts)
	end,
}

M.opts = {}

return M.plugin
