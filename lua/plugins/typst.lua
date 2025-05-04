local M = {}

M.plugin = {
	"chomosuke/typst-preview.nvim",
	lazy = false, -- or ft = 'typst'
	version = "1.*",
	opts = M.opts, -- lazy.nvim will implicitly calls `setup {}`
	ft = "typst",
}

M.opts = {}

return M.plugin
