local M = {}

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

M.plugin = {
	"williamboman/mason.nvim",
	dependencies = { "williamboman/mason-lspconfig.nvim" },
	config = function()
		require("mason").setup(M.opts.mason)
		require("mason-lspconfig").setup(M.opts.mason_lspconfig)

		for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
			if server == "rust_analyzer" then
				goto continue
			end

			if server == "lua_ls" then
				vim.lsp.config(server, {
					capabilities = capabilities,
					on_attach = M.on_attach,
					handlers = M.handlers,
					hints = { enable = true },
					settings = {
						telemetry = {
							enable = false,
						},

						diagnostics = {
							globals = { "vim" },
						},

						workspace = {
							library = { vim.api.nvim_get_runtime_file("", true), "${3rd}/love2d/library" }, -- add Neovim runtime to workspace
							checkThirdParty = false, -- prevents annoying "configure workspace" prompts
						},
					},
				})

				vim.lsp.enable(server)
				goto continue
			end

			vim.lsp.config[server] = {
				capabilities = capabilities,
				on_attach = M.on_attach,
				handlers = M.handlers,
				hints = { enable = true },
			}

			vim.lsp.enable(server)

			::continue::
		end
	end,
}

M.opts = {}
--@class MasonSettings
M.opts.mason = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
}

M.opts.mason_lspconfig = {
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"clangd",
	},

	automatic_installation = true,
	automatic_enable = false,
}

M.on_attach = function(_, bufnr)
	local opts = { noremap = true, silent = true }
	opts.buffer = bufnr
	opts.desc = "Show LSP References"
	local remap = vim.keymap.set

	remap("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	remap("n", "<leader>gd", function()
		vim.lsp.buf.definition()
	end, opts)
	remap("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, opts)
	remap("n", "E", function()
		vim.diagnostic.open_float()
	end, opts)
	remap("n", "K", function()
		vim.lsp.buf.hover({ border = "rounded" })
	end, opts)
	remap("n", "<leader>ws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	remap("n", "<leader>vrf", function()
		vim.lsp.buf.references()
	end, opts)
	remap("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end

return M.plugin
