local M = {}

M.plugin = {
    "Shatur/neovim-ayu",
    config = function()
        return require("ayu").setup(M.opts)
    end
}

M.opts = {
    overrides = {
        Normal = { bg = "None" },
        -- NormalFloat = { bg = "none" },
        -- ColorColumn = { bg = "None" },
        -- SignColumn = { bg = "None" },
        -- Folded = { bg = "None" },
        -- FoldColumn = { bg = "None" },
        -- CursorLine = { bg = "None" },
        -- CursorColumn = { bg = "None" },
        -- VertSplit = { bg = "None" },
    }
}

return M.plugin
