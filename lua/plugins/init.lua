local M = {}

M.plugins = {
	{ "nvim-tree/nvim-web-devicons" },
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			return require("plugins.configs.telescope")
		end,
	},

	-- themes
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			return require("plugins.configs.rose-pine")
		end,
	},
	{
		"navarasu/onedark.nvim",
		name = "onedark",
		config = function()
			local onedark = require("onedark")

			onedark.setup({
				style = "darker",
				transparent = true,

				code_style = {
					comments = "none",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				diagnostics = {
					undercurl = false,
				},
				lualine = { transparent = false },
			})
		end,
	},
	{ "ellisonleao/gruvbox.nvim" },

	{
		"https://github.com/hrsh7th/nvim-cmp",
		config = function()
			return require("plugins.configs.cmp")
		end,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"https://github.com/neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
		},
		config = function()
			return require("plugins.configs.lsp")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			return require("plugins.configs.mason")
		end,
		dependencies = { "williamboman/mason-lspconfig.nvim" },
	},
	{ "https://github.com/L3MON4D3/LuaSnip" },
	{ "https://github.com/navarasu/onedark.nvim" },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
		},
	},
	{
		"tiagovla/tokyodark.nvim",
		opts = {
			transparent_background = true,
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
				identifiers = { italic = false },
			},
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			return require("plugins.configs.conform")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			return require("plugins.configs.treesitter")
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup({})
		end,
	},
	{ "ThePrimeagen/harpoon", lazy = false },
	{
		"gelguy/wilder.nvim",
		config = function()
			return require("plugins.configs.wilder")
		end,
		dependencies = { "roxma/nvim-yarp" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			return require("plugins.configs.lualine")
		end,
	},
}

return M
