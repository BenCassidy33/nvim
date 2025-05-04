local M = {}

M.plugin = {
	"https://github.com/akinsho/toggleterm.nvim",
	config = function()
		vim.keymap.set("n", "!", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true })
		return require("toggleterm").setup(M.opts)
	end,
}

M.opts = {}

return M.plugin
