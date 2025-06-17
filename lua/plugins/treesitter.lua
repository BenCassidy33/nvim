local M = {}

M.plugins = {}

---@class LazyPluginSpec
M.plugins[1] = {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	config = function()
		return require("nvim-treesitter.configs").setup(M.opts[1])
	end,
}

M.opts = {}

M.opts[1] = {
	ensure_installed = {
		"c",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"markdown",
		"markdown_inline",
		"javascript",
		"typescript",
	},
	ignore_isntall = { "none" },
	auto_install = true,
	highlight = {
		enable = true,
		disbale = {},
	},
}

-- local M = {}

M.plugins[2] = {
	-- "nvim-treesitter/playground",
	-- config = function()
	-- 	return require("nvim-treesitter.configs").setup(M.opts)
	-- end,
}

return M.plugins
