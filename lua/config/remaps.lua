local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- keymap.set("n", "<C-o>", function()
--   local keys = vim.api.nvim_replace_termcodes("O<ESC>", true, false, true)
--   vim.api.nvim_feedkeys(keys, "n", false)
-- end)

keymap.set("n", "<leader>T", "<cmd>Twilight<CR>")
vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-t>", "<cmd>NvimTreeFocus<CR>")

vim.keymap.set("n", "<leader>/", function()
  vim.cmd("split")
  vim.cmd("term")
end)
