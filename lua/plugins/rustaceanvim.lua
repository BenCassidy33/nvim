local M = {}

M.plugin = {
	"mrcjkb/rustaceanvim",
	config = function()
		-- require("rustaceanvim").setup(M.opts)
		M.setup()
	end,
	ft = { "rust" },
	version = "^6",
	lazy = true,
}

M.opts = {}
M.setup = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local lsp = vim.cmd.RustLsp

	vim.keymap.set("n", "<leader>ca", "<cmd>RustLsp codeAction<CR>", { silent = true, buffer = bufnr })

	vim.keymap.set("n", "<C-h>", function()
		lsp("openDocs")
	end, {})

	vim.keymap.set("n", "E", function()
		lsp({ "renderDiagnostic", "cycle" })
	end, {})

	vim.keymap.set("n", "<leader>gd", function()
		vim.lsp.buf.definition()
	end, {})

	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end, {})

	vim.keymap.set("n", "K", function()
		-- lsp({ "hover", "actions" })
		vim.lsp.buf.hover({ border = "rounded" })
	end)
end

return M.plugin
