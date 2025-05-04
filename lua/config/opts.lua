local utils = require("utils")
local opt = vim.opt

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
opt.laststatus = 0

vim.cmd("set clipboard+=unnamedplus")
vim.diagnostic.config({ virtual_lines = true })

-- vim.cmd("TransparentEnable")
