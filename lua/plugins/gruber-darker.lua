local M = {}

M.plugin = {
	"https://github.com/blazkowolf/gruber-darker.nvim",
	config = function()
        require("gruber-darker").setup(M.opts)
    end,
}

M.opts = {
    italic = {
        strings = false,
        comments = false,
        folds = false,
    },
    undercurl = false
}

return M.plugin
