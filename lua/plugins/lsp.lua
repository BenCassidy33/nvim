-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md for configurations.plug
local M = {}

M.plugin = {
	"https://github.com/neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		"https://github.com/nvim-lua/plenary.nvim.git",
	},
}

return M.plugin
