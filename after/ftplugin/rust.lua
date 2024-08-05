local bufnr = vim.api.nvim_get_current_buf()
local lsp = vim.cmd.RustLsp

vim.keymap.set(
  "n",
  "<leader>ca",
  "<cmd>RustLsp codeAction<CR>",
  { silent = true, buffer = bufnr }
)

vim.keymap.set(
  "n",
  "<C-h>",
  function()
    lsp('openDocs')
  end,
  {}
)

vim.keymap.set("n", "E", function()
  lsp({ 'renderDiagnostic', 'cycle' })
end, {})

vim.keymap.set("n", "<leader>gd", function()
  vim.lsp.buf.definition()
end, opts)

vim.keymap.set("n", "<leader>rn", function()
  vim.lsp.buf.rename()
end, opts)

vim.keymap.set("n", "K", function()
  lsp({ "hover", "actions" })
end)
