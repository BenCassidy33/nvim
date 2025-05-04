local M = {}

M.plugin = {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup(M.opts.mason)
		require("mason-lspconfig").setup(M.opts.mason_lspconfig)
	end,
}

M.opts = {
	--@class MasonSettings
	mason = {
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗"

			}
		}
	},

	mason_lspconfig = {
		ensure_installed = {
			"lua_ls",
			"rust_analyzer",
			"clangd"
		},

		automatic_installation = true,
	}
	-- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },
	--
}

return M.plugin
