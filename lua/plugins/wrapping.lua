local M = {}

M.plugin = {
	"andrewferrier/wrapping.nvim",
	config = function()
		require("nvim-word.lua.plugins.wrapping").setup(M.opts)
		require("nvim-word.lua.plugins.wrapping").hard_wrap_mode()
	end,
	ft = { "markdown", "typst", "plaintext" },
}

M.opts = {
	create_keymaps = true,
	create_commands = true,
	notify_on_switch = true,
	auto_set_mode_filetype_allowlist = {
		"asciidoc",
		"gitcommit",
		"latex",
		"mail",
		"markdown",
		"rst",
		"tex",
		"text",
		"typst",
	},
}

return M.plugin
