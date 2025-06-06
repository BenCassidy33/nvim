local M = {}

M.plugin = {
	"https://github.com/stevearc/conform.nvim",
	config = function()
		return require("conform").setup(M.opts)
	end,
}

M.opts = {
	formatters_by_ft = {
		asm = { "asmfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		markdown = { "prettier" },
		toml = { "prettier" },
		yaml = { "prettier" },
		lua = { "stylua" },
		rust = { "rustfmt", "yew-fmt" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		go = { "gofumpt", "goimports-reviser" },
		sql = { "sqlfmt" },
		python = { "ruff_format", "ruff_organize_imports" },

		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
	},

	format_on_save = function(bufnr)
		-- Disable with a global or buffer-local variable
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,

	log_level = vim.log.levels.OFF,
	notify_on_error = false,
}

return M.plugin
