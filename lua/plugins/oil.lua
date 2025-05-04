--@module 'oil'
--@type oil.SetupOpts
local opts = {
  default_file_explorer = true,
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
}


return {
	"https://github.com/stevearc/oil.nvim",
	dependencies = { { "https://github.com/nvim-tree/nvim-web-devicons", opts = {} }},
	config = function()
		return require("oil").setup(opts)
	end
}


