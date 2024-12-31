require("telescope").setup({

  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false,
      hidden = false,
      layout_config = {
        -- width = 2.2,
        width = 0.55,
        height = 0.45
      }
    },

    help_tags = {
      --theme = "dropdown",
      previewer = true,
    },
  },

  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    selection_caret = " ➜ ",
    prompt_prefix = " ➜ ",
    -- prompt_prefix = " ->  ",
    -- selection_caret = " -> ",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {},
      mirror = false,
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
  },

  path_display = function(opts, path)
    local tail = require('telescope.utils').path_tail(path)
    return string.format("  %s", tail)
  end
})

require("telescope").load_extension("git_worktree")

local keymap = vim.keymap

keymap.set("n", "<C-f>", "<CMD>Telescope find_files<CR>", { silent = true })
keymap.set("n", "<C-g>", "<CMD>Telescope live_grep<CR>", { silent = true })
keymap.set("n", "<leader>bu", "<CMD>Telescope buffers<CR>", { silent = true })
keymap.set("n", "<leader>wt", function()
  require("telescope").extensions.git_worktree.git_worktrees()
end, { silent = true })
keymap.set("n", "<leader>th", "<CMD>Telescope help_tags<CR>", { silent = true })
