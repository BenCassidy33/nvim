local M = {}

M.plugin = {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        require("mason").setup(M.opts.mason)
        require("mason-lspconfig").setup(M.opts.mason_lspconfig)
    end,
}

M.opts = {}
--@class MasonSettings
M.opts.mason = {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"

        }
    }
}

M.opts.mason_lspconfig = {
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "clangd",
    },

    automatic_installation = true,

    handlers = function (server_name)
        print("Setting up " .. server_name)
        lspconfig[server_name].setup{
            capabilities = capabilities,
            on_attach = M.on_attach,
            handlers = M.handlers,
            hints = { enable = true }
        }
    end,
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
