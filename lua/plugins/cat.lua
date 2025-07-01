local M = {}

M.plugin = {
    "catppuccin/nvim",
    config = function()
        return require("catppuccin").setup(M.opts)
    end
}

M.opts = {
    no_italic = true,
    term_colors = true,
    transparent_background = true,
}

return M.plugin
