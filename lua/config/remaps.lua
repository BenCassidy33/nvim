local remap = vim.keymap.set

remap("i", "jj", "<Esc>", { noremap = true, silent = true })
remap("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })
remap("v", "<leader>y", '"+y', { noremap = true, silent = true })
remap("n", "<leader>zm", "<CMD>ZenMode<CR>", { noremap = true, silent = false })
