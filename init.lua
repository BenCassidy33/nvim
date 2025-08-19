require("config.lazy")
require("config.opts")
require("config.remaps")
require("config.autocmd")

vim.cmd("colorscheme tairiki")
vim.cmd("TransparentEnable")

local color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Keyword", link = false }).fg)

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "none" })

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#888888" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = color, bold = true, bg = "none" })

vim.api.nvim_set_hl(0, "MyPmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { fg = color, bg = "none", bold = true })
