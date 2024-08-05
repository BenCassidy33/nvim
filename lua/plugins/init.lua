local M = {}

M.plugins = {
  { "nvim-tree/nvim-web-devicons" },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      return require("plugins.configs.oil")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      return require("plugins.configs.telescope")
    end,
  },

  -- themes
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      return require("plugins.configs.rose-pine")
    end,
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    config = function()
      local onedark = require("onedark")

      onedark.setup({
        style = "darker",
        transparent = true,

        code_style = {
          comments = "none",
          keywords = "none",
          functions = "none",
          strings = "none",
          variables = "none",
        },

        diagnostics = {
          undercurl = false,
        },
        lualine = { transparent = false },
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      terminal_colors = true,
      strikethrough = false,
      undercurl = false,
      underline = true,
      transparent_mode = true
    },
  },

  {
    "https://github.com/hrsh7th/nvim-cmp",
    config = function()
      return require("plugins.configs.cmp")
    end,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "https://github.com/neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      return require("plugins.configs.lsp")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      return require("plugins.configs.mason")
    end,
    dependencies = { "williamboman/mason-lspconfig.nvim" },
  },
  { "https://github.com/L3MON4D3/LuaSnip" },
  { "https://github.com/navarasu/onedark.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },

      on_hightlights = function(hl, _)
        hl.DiagnosticUnderlineWarn.undercurl = false
        hl.DiagnosticUnderlineWarn.underline = true
      end
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      return require("plugins.configs.conform")
    end,
  },
  {
    -- treeshitter
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      return require("plugins.configs.treesitter")
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  { "https://github.com/nvim-treesitter/nvim-treesitter-context" },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    branch = "harpoon2",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      return require("plugins.configs.harpoon")
    end,
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      return require("plugins.configs.wilder")
    end,
    dependencies = { "roxma/nvim-yarp" },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      return require("plugins.configs.lualine")
    end,
    enabled = false,
  },
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      },
    },
  },
  -- {
  -- 	"https://github.com/nvimdev/dashboard-nvim",
  -- 	config = function()
  -- 		return require("plugins.configs.dashboard")
  -- 	end,
  -- 	dependencies = { "nvim-lua/plenary.nvim" },
  -- },
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true, -- show highlights only after keypress
        dim = true,              -- dim all other characters if set to true (recommended!)
      })
    end,
  },
  {
    "https://github.com/blazkowolf/gruber-darker.nvim",
    opts = {
      bold = true,
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      },
      undercurl = false,
      underline = true,
    },
  },
  {
    "xiyaowong/transparent.nvim",
  },
  { "https://github.com/ThePrimeagen/git-worktree.nvim" },
  { "https://github.com/echasnovski/mini.colors" },
  {
    "https://github.com/catppuccin/nvim",
    config = function()
      require("catppuccin").setup {
        transparent_background = false, -- disables setting the background color.
        background = {
          dark = "mocha"
        }
      }
    end
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false,   -- This plugin is already lazy
  },
  {
    "https://github.com/mfussenegger/nvim-dap",
    config = function()
      return require('plugins.configs.dap')
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup {}

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  },
  {
    "https://github.com/folke/neodev.nvim",
    config = function()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true }
      })
    end
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
    enabled = false
  },
  -- {
  --   "https://github.com/ggandor/leap.nvim",
  --   opts = {},
  --   lazy = false,
  --   config = function()
  --     require('leap').create_default_mappings()
  --   end
  -- },
  {
    "wallpants/github-preview.nvim",
    cmd = { "GithubPreviewToggle" },
    opts = {
      host = "localhost",
      port = 6041,
      single_file = false,
      theme = { name = "dark", high_contrast = false },
      log_level = "verbose",
    },
    config = function(_, opts)
      local gpreview = require("github-preview")
      gpreview.setup(opts)

      local fns = gpreview.fns
      vim.keymap.set("n", "<leader>mpt", fns.toggle)
      vim.keymap.set("n", "<leader>mps", fns.single_file_toggle)
      vim.keymap.set("n", "<leader>mpd", fns.details_tags_toggle)
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",

    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Notes/",
        },
      },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,

      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end
        }
      }

    }
  },
  {
    "andrewferrier/wrapping.nvim",
    ft = { "markdown" },
    config = function()
      require("wrapping").setup()
    end
  },
  -- Lua
  {
    "folke/twilight.nvim",
    opts = {
      "function",
    }
  },
  {
    "https://github.com/paretje/nvim-man",
  },
  {
    "https://github.com/assistcontrol/readline.nvim",
    config = function()
      local readline = require('readline')
      -- todo
    end
  },
  {
    "https://github.com/shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_disable_background = true
    end
  },
  {
    "https://github.com/Mofiqul/vscode.nvim",
    opts = {
      transparent = true,
    }
  },
  {
    "https://github.com/AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.load()
    end
  },
  {
    "https://github.com/marko-cerovac/material.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      disable = {
        background = true,
        term_colors = true,
      }
    }
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "https://github.com/EdenEast/nightfox.nvim",
  }
}

return M
