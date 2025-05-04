local M = {}

M.plugin = {
	"gelguy/wilder.nvim",
	config = function()
		local wilder = require("wilder")
		wilder.setup(M.opts)
		wilder.set_option(
			"renderer",
			wilder.wildmenu_renderer({
				highlighter = wilder.basic_highlighter(),
				separator = "  ",
				-- left = { " ", wilder.wildmenu_spinner(), " " },
				-- right = { " ", wilder.wildmenu_index() },
				highlights = {
					default = wilder.make_hl(
						"WilderDefault",
						"Pmenu",
						{ { a = 1 }, { a = 1 }, { foreground = "#ffffff", background = "#1c1c1c" } }
					),
				},
			})
		)
	end,
	dependencies = { "roxma/nvim-yarp" },
}

M.opts = {
	modes = { ":" },
}

return M.plugin
