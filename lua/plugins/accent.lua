local M = {}

M.plugin = {
    "https://github.com/Alligator/accent.vim",
    config = function()
        -- return require("").setup(M.opts)
        vim.cmd("let g:accent_colour = 'blue'")
    end
}

M.opts = {
}

return M.plugin
