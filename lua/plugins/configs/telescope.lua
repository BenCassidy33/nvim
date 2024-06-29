require("telescope").setup({
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
		prompt_prefix = " ➜  ",
		selection_caret = "  ",
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
})
