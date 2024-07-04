local opt = vim.opt

opt.guicursor = ""
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.pumheight = 10
opt.autoindent = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim.undodir"
opt.undofile = true
opt.wrap = false
opt.mouse = "a"
opt.termguicolors = true
opt.scrolloff = 10
opt.isfname:append("@-@")
opt.updatetime = 50
opt.fillchars = { eob = " " }

vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set nohlsearch")

-- vim.api.nvim_create_autocmd("ExitPre", {
-- 	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
-- 	command = "set guicursor=a:ver90",
-- 	desc = "Set cursor back to beam when leaving Neovim.",
-- })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "ts", "js", "tsx", "jsx", "lua", "c", "cpp" },
	callback = function()
		opt.shiftwidth = 2
		opt.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.opt.formatoptions:remove({ "r", "o" })
	end,
})
