local remap = vim.keymap.set

remap("i", "jj", "<Esc>", { noremap = true, silent = true })
remap("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })
remap("v", "<leader>y", '"+y', { noremap = true, silent = true })
remap("n", "<leader>zm", "<CMD>ZenMode<CR>", { noremap = true, silent = false })
remap("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
remap("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
remap("n", "<leader><leader>s", "<CR>so /home/benc/.config/nvim/init.lua<CR>", { noremap = true, silent = false })


local opts = { noremap = true, silent = true }
-- opts.buffer = bufnr
-- opts.desc = "Show LSP References"

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

