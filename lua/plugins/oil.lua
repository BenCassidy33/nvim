local M = {}

M.plugin = {
	"https://github.com/stevearc/oil.nvim",
	config = function()
		return require("oil").setup(M.opts)
	end,
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
}

M.opts = {
	default_file_explorer = true,
	columns = {
		"icon",
	},

	view_options = {
		show_hidden = true,
	},
}

return M.plugin

-- local opts = {
-- 	default_file_explorer = true,
-- 	columns = {
-- 		"icon",
-- 	},
--
-- 	view_options = {
-- 		show_hidden = true,
-- 	},
-- }
--
-- return {
-- 	"https://github.com/stevearc/oil.nvim",
-- 	dependencies = { { "echasnovski/mini.icons", opts = {} } },
-- 	config = function()
-- 		return require("oil").setup(opts)
-- 	end,
-- }
