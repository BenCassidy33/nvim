local M = {}

---@class LazyPluginSpec
M.plugin = {
	"https://github.com/nvim-treesitter/nvim-treesitter",
	config = function ()
		return require("nvim-treesitter.configs").setup(M.opts)
	end
}

M.opts = {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "typescript" },
  ignore_isntall = { "none" },
  auto_install = true,
  highlight = {
	  enable = true,
	  disbale = {},
  }
}

return M.plugin
