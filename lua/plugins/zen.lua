local M = {}

M.plugin = {
	"folke/zen-mode.nvim",
	opts = M.opts,
	ft = { "markdown", "typst" },
	-- cmd = "ZenMode",
}

M.opts = {
	options = {
		number = false,
		relativenumber = false,
	},
	plugins = {
		tmux = { enabled = true },
	},

	on_open = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
	end,
}

return M.plugin
