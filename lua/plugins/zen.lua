local M = {}

M.plugin = {
	"folke/zen-mode.nvim",
	opts = M.opts,
	ft = { "markdown", "typst" },
	cmd = "ZenMode",
}

---@type ZenOptions
M.opts = {}

return M.plugin
