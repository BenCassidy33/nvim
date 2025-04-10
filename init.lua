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

Colorscheme = "tairiki-dark"
-- Colorscheme = "gruber-darker"
-- Colorscheme = "github_dark"
-- Colorscheme = "onedark_vivid"
-- Colorscheme = "gruvbox_sat"
-- Colorscheme = "onedark_vivid"

-- Colorscheme = "carbonfox"
--Colorscheme = "nordfox-sat"
--Colorscheme = "tokyonight-storm"
--Colorscheme = "vscode-sat"
-- Colorscheme = "vscode"



vim.cmd("colorscheme " .. Colorscheme)
vim.cmd("TransparentEnable")
vim.opt.laststatus = 0

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = none, undercurl = none })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = none, undercurl = none })

-- vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = none })
-- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = none })


vim.cmd("highlight Pmenu guibg=NONE") -- transparency for cmp

vim.lsp.inlay_hint.enable(false)

-- TODO: Change Neovide Background color to match terminal color
if vim.g.neovide then
  local opt = vim.o
  local map = vim.keymap

  local alpha = function()
    return string.format("%x", math.floor(255 * 0.85))
  end

  -- opt.guifont = "Liga SFMono Nerd Font:h10"
  -- opt.guifont = "JetBrainsMono Nerd Font:h14"
  -- opt.guifont = "Source Code Pro:h9"
  --opt.guifont = "RobotoMono Nerd Font"
  opt.guifont = "SFMono SemiBold Nerd Font Complete"

  vim.g.colors_name = Colorscheme
  vim.cmd("TransparentDisable")
  -- vim.g.neovide_transparency = 0.85
  -- vim.g.neovide_background_color = "#121212"

  map.set({ "n", "v" }, "<C-+>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  map.set({ "n", "v" }, "<C-_>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")
  map.set({ "n", "v" }, "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>")
end

local background = "#191b21"

local ColorChanges = {
  TelescopeSelection = { bg = background },
  TelescopePromptPrefix = { bg = background },
  TelescopePromptBorder = { bg = background },
  TelescopePromptNormal = { bg = background },
  HarpoonBorder = { bg = background },

  Normal = { bg = background },
  LineNr = { bg = background },
  CursorLineNr = { bg = background }
}

for k, v in pairs(ColorChanges) do
  vim.api.nvim_set_hl(0, k, v)
end

vim.filetype.add({
  extension = {
    c3 = "c3",
    c3i = "c3i"
  }
})
