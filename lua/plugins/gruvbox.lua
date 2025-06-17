local M = {}

M.plugin = {
    "https://github.com/ellisonleao/gruvbox.nvim",
    config = function()
        return require("gruvbox").setup(M.opts)
    end
}


M.opts = {
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },

  transparent_mode = true,
  }

return M.plugin
