require("plugins.configs")
require("config")

-- Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = require("plugins").plugins,
  checker = { enabled = true, notify = false },
})

vim.cmd("colorscheme gruvbox")

--vim.cmd("colorscheme onedark_sat")
--vim.cmd("colorscheme gruber-darker")
--vim.cmd("colorscheme catppuccin-mocha-sat")
--vim.cmd("colorscheme tokyonight-night")
vim.cmd("TransparentEnable")
vim.opt.laststatus = 0


vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = none, undercurl = none })

vim.cmd("highlight Pmenu guibg=NONE") -- tranparency for cmp
