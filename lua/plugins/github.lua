local M = {}

M.plugin = {
  "https://github.com/projekt0n/github-nvim-theme",
  config = function()
    return require("github-theme").setup(M.opts)
  end
}

M.opts = {
  
}

return M.plugin
