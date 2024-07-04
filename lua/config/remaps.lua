local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
keymap.set("n", "-", "<CMD>Oil<CR>", { noremap = true, silent = true })

-- Telescope
keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { silent = true })
keymap.set("n", "<leader>gs", "<CMD>Telescope live_grep<CR>", { silent = true })
keymap.set("n", "<leader>bu", "<CMD>Telescope buffers<CR>", { silent = true })
keymap.set("n", "<leader>wt", function()
	require("telescope").extensions.git_worktree.git_worktrees()
end, { silent = true })

keymap.set("n", "<leader>th", "<CMD>Themery<CR>", { silent = true })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

keymap.set("n", "<C-l>", function()
	local keys = vim.api.nvim_replace_termcodes('oprintln!("{:?}", );<ESC>bi', true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { silent = true, noremap = true })

keymap.set("i", "<C-l>", function()
	local keys = vim.api.nvim_replace_termcodes('println!("{:?}", );<ESC>bi', true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end, { silent = true, noremap = true })

keymap.set("n", "<leader>pv", function()
	local keys = vim.api.nvim_replace_termcodes('viwyoprintln!("{:?}", <C-c>pa); <C-c>', true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)

keymap.set("n", "<C-o>", function()
	local keys = vim.api.nvim_replace_termcodes("O<ESC>", true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)
