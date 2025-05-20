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
	config = function()
		return M.setup()
	end,
}

-- M.get_lsps = function()
-- 	local registry = require("mason-registry")
-- 	for _, pkg in ipairs(registry.get_installed_packages()) do
-- 		if pkg.spec.categories[1] == "LSP" and pkg.spec.name ~= "rust_analyzer" then
-- 			print(pkg.name)
-- 			for key, _ in pairs(pkg) do
-- 				print("     ", key)
-- 			end
-- 		end
-- 	end
-- end

local auto_setup_ignore = {
	["lua-language-server"] = true,
	["rust_analyzer"] = true,
}

M.setup = function()
	local lspconfig = require("lspconfig")
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = cmp_nvim_lsp.default_capabilities()
	local registry = require("mason-registry")
	local mlsp = require("mason-lspconfig").get_mappings()["mason_to_lspconfig"]

	for _, pkg in ipairs(registry.get_installed_packages()) do
		if
			mlsp ~= nil
			and pkg.spec.categories[1] == "LSP"
			and not auto_setup_ignore[pkg.spec.name]
			and pkg.spec.name ~= "lua-language-server"
			and pkg.spec.name ~= "rust_analyzer"
		then
			lspconfig[mlsp[pkg.name]].setup({
				capabilities = capabilities,
				on_attach = M.on_attach,
				handlers = M.handlers,
				hints = { enable = true },
			})
		end
	end

	lspconfig.lua_ls.setup({
		settings = { Lua = {
			telemetry = { enable = false },
			diagnostics = { globals = { "vim" } },
		} },
	})
	vim.diagnostic.config({ signs = false })
end

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
		vim.lsp.buf.hover()
	end, opts)
	remap("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	remap("n", "]d", function()
		vim.diagnostic.goto_prev()
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

M.handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "none" }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "none" }),
}

return M.plugin
