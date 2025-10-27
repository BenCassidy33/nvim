local M = {}

M.plugin = {
    "https://github.com/loctvl842/monokai-pro.nvim",
    config = function()
        return require("monokai-pro").setup(M.opts)
    end
}

M.opts = {
    
}

return M.plugin
