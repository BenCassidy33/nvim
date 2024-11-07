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

Colorscheme = "tokyonight"

vim.g.colors_name = Colorscheme
vim.cmd("TransparentEnable")

vim.opt.laststatus = 0

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = none, undercurl = none })

vim.cmd("highlight Pmenu guibg=NONE") -- tranparency for cmp

if vim.g.neovide then
  local opt = vim.o
  local map = vim.keymap

  -- opt.guifont = "Liga SFMono Nerd Font:h10"
  opt.guifont = "JetBrainsMono Nerd Font:h14"
  vim.g.colors_name = Colorscheme
  vim.cmd("TransparentDisable")
  vim.g.neovide_transparency = 0.85

  map.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  map.set({ "n", "v" }, "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  map.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end
