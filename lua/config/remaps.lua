local remap = vim.keymap.set

remap("i", "jj", "<Esc>", { noremap = true, silent = true })
remap("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })
remap("v", "<leader>y", '"+y', { noremap = true, silent = true })
remap("n", "<leader>zm", "<CMD>ZenMode<CR>", { noremap = true, silent = false })
remap("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
remap("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
remap("n", "<leader><leader>s", "<CR>so /home/benc/.config/nvim/init.lua<CR>", { noremap = true, silent = false })
