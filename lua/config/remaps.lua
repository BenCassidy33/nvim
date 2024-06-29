local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })

-- Telescope
keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
keymap.set("n", "<leader>gs", "<CMD>Telescope live_grep<CR>", { silent = true })
keymap.set("n", "<leader>bu", "<CMD>Telescope buffers<CR>", { silent = true })

-- Tmux
vim.cmd("let g:tmux_navigator_no_mappings = 1")
vim.cmd("let g:tmux_navigator_save_on_switch = 2")
vim.cmd("let g:tmux_navigator_perserve_zoom = 1")

keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>")

-- Harpoon
-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
-- local term = require("harpoon.term")
--
-- --keymap.set("n", "<leader>a", mark.add_file)
-- keymap.set("n", "<C-e>", ui.toggle_quick_menu)
--
-- keymap.set("n", "<leader>1", function()
-- 	ui.nav_file(1)
-- end, { noremap = true })
-- keymap.set("n", "<leader>2", function()
-- 	ui.nav_file(2)
-- end, { noremap = true })
-- keymap.set("n", "<leader>3", function()
-- 	ui.nav_file(3)
-- end, { noremap = true })
-- keymap.set("n", "<leader>4", function()
-- 	ui.nav_file(4)
-- end, { noremap = true })
--
-- keymap.set("n", "<leader>6", function()
-- 	term.gotoTerminal(2)
-- end)
