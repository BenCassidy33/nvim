local lspconfig = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local keymap = vim.keymap

local opts = { noremap = true, silent = true }

local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(_, bufnr)
  opts.buffer = bufnr
  opts.desc = "Show LSP References"

  keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
  keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  keymap.set("n", "<leader>e", function() vim.diagnostic.open_float() end, opts)
  keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  keymap.set("n", "<leader>vrf", function() vim.lsp.buf.references() end, opts)
  keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

local lsps = { "rust_analyzer", "lua_ls", "tsserver", "pyright", "clangd", "taplo" }

for _, ls in ipairs(lsps) do
  lspconfig[ls].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

vim.diagnostic.config {
  signs = false
}
