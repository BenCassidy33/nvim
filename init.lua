require("config.lazy")
require("config.opts")
require("config.remaps")
require("config.autocmd")

vim.cmd("colorscheme gruber-darker")
-- vim.cmd("TransparentEnable")

if vim.g.colors_name == "gruber-darker" then
	vim.api.nvim_set_hl(0, "@property", { fg = "#ffffff" })
	vim.cmd("TransparentDisable")
end
