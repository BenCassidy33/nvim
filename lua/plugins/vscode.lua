local M = {}

M.plugin = {
    "https://github.com/Mofiqul/vscode.nvim",
    config = function()
        return require("vscode").setup(M.opts)
    end
}

M.opts = {
    transparent = true,

}

return M.plugin
