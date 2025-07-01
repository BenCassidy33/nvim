local M = {}

M.plugin = {
    "rose-pine/neovim",
    config = function()
        return require("rose-pine").setup(M.opts)
    end
}

M.opts = {
    styles = {
        transparency = true
    }
}

return M.plugin
