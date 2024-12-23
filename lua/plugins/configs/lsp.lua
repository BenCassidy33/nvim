local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local keymap = vim.keymap
local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

local opts = { noremap = true, silent = true }

local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(_, bufnr)
  opts.buffer = bufnr
  opts.desc = "Show LSP References"

  keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, opts)
  keymap.set("n", "<leader>gd", function()
    vim.lsp.buf.definition()
  end, opts)
  keymap.set("n", "<leader>rn", function()
    vim.lsp.buf.rename()
  end, opts)
  keymap.set("n", "E", function()
    vim.diagnostic.open_float()
  end, opts)
  keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end, opts)
  keymap.set("n", "[d", function()
    vim.diagnostic.goto_next()
  end, opts)
  keymap.set("n", "]d", function()
    vim.diagnostic.goto_prev()
  end, opts)
  keymap.set("n", "<leader>ws", function()
    vim.lsp.buf.workspace_symbol()
  end, opts)
  keymap.set("n", "<leader>vrf", function()
    vim.lsp.buf.references()
  end, opts)
  keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
  end, opts)
end


-- LSP settings (for overriding per client)
local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local lsps = { "lua_ls", "ts_ls", "pyright", "clangd", "taplo", "zls", "gopls", "cssls", "bashls", "html",
  "astro", "emmet_language_server", "julials", "ols" }

for _, ls in ipairs(lsps) do
  lspconfig[ls].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    handlers = handlers,
    hints = { enable = true }
  })
end

vim.diagnostic.config({
  signs = false,
})
