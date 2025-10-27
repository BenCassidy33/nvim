require("config.lazy")
require("config.opts")
require("config.remaps")
require("config.autocmd")

vim.cmd("colorscheme gruvbox-minor")
-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme vscode")

local color = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Keyword", link = false }).fg)

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#ffffff", bg = "none" })

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#888888" })
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = color, bold = true })

vim.api.nvim_set_hl(0, "MyPmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { fg = color, bg = "none", bold = true })
