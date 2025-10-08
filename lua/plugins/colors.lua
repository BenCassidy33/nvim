local M = {}

M.plugin = {
    "https://github.com/nvim-mini/mini.colors",
    config = function()
        vim.api.nvim_create_user_command("Minicolors", function ()
            require("mini.colors").setup()
        end, {})
    end
}

M.opts = {
}

return M.plugin
