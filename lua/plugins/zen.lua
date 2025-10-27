local M = {}

M.plugin = {
	"folke/zen-mode.nvim",
	opts = M.opts,
	cmd = "ZenMode",
}

M.opts = {
	options = {
		enabled = true,
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
