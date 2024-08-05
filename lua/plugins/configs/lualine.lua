require("lualine").setup({
  options = {
    icons_enabled = true,
    --theme = "ayu_mirage",
    theme = "gruvbox",
    component_separators = { left = "", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "filename" },
    lualine_c = { "harpoon2" },
    lualine_x = {},
    lualine_y = { "diff", "branch", "diagnostics" },
    lualine_z = { "location" },
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
})
