local utils = require("utils")

local M = {}

M.plugin = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup(M.opts)
		utils.SetKeymaps(M.keymaps)
	end,
}

M.opts = {
	pickers = {
		find_files = {
			hidden = false,
			layout_config = {},
			colorscheme = {
				enable_preview = true,
			},
		},

		help_tags = {
			previewer = true,
		},
	},

	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		selection_caret = " ➜ ",
		prompt_prefix = " ➜ ",
		-- prompt_prefix = " ->  ",
		-- selection_caret = " -> ",
		layout_config = {
			horizontal = {
				prompt_position = "bottom",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {},
			mirror = false,
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
	},

	path_display = function(opts, path)
		local tail = require("telescope.utils").path_tail(path)
		return string.format("  %s", tail)
	end,
}

---@type table<string, ModeKeymaps>
M.keymaps = {
	["n"] = {
		opts = { silent = true },
		{ "<C-f>", "<CMD>Telescope find_files<CR>" },
		{ "<C-g>", "<CMD>Telescope live_grep<CR>" },
		{ "<leader>bu", "<CMD>Telescope buffers<CR>" },
		{
			"<leader>wt",
			function()
				require("telescope").extensions.git_worktree.git_worktrees()
			end,
		},
		{ "<leader>th", "<CMD>Telescope help_tags<CR>" },
	},
}

return M.plugin
