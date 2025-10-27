local M = {}

M.plugin = {
    "https://github.com/ricardoraposo/gruvbox-minor.nvim",
    config = function()
        return require("gruvbox-minor").setup(M.opts)
    end
}

M.opts = {
    
}

return M.plugin
