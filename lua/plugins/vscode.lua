local M = {}

M.plugin = {
    "https://github.com/Mofiqul/vscode.nvim",
    config = function()
        return require("vscode").setup(M.opts)
    end
}

M.opts = {
    transparent = true,
    italic_comments = false,
    terminal_colors = true,
}

return M.plugin
