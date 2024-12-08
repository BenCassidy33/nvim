local M = {}

M.plugins = {
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require('nvim-tree').setup {
        view = { side = "right" }
      }
    end
  },
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
        transparent = false,
        term_colors = true,

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
      strikethrough = true,
      undercurl = false,
      underline = true,
      contrast = "hard", -- can be "hard", "soft" or empty string
      transparent_mode = true,
      -- transparent_mode = true,
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
      transparent = false,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",

        comments = { italic = false },
        keywords = { italic = false },
      },

      on_highlights = function(hl, _)
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
    "https://github.com/roxma/nvim-yarp"
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      return require("plugins.configs.wilder")
    end,
    dependencies = { "roxma/nvim-yarp" },
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --     return require("plugins.configs.lualine")
  --   end,
  --
  --   -- enabled = true,
  -- },
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
  {
    "https://github.com/ggandor/leap.nvim",
    opts = {},
    lazy = false,
    config = function()
      require('leap').create_default_mappings()
    end
  },
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
      -- vim.g.nord_disable_background = true
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
        -- background = true,
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
      })
    end
  },
  {
    "https://github.com/EdenEast/nightfox.nvim",
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end,
  },
  {
    "https://github.com/lewis6991/gitsigns.nvim",
    config = function()
      return require "plugins.configs.gitsigns"
    end
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },

  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
      })
    end,
  },
  {
    "https://github.com/drewtempelmeyer/palenight.vim",
  },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = 'latexrun'
      vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
    end
  },
  {
    "https://github.com/nyoom-engineering/oxocarbon.nvim",
    lazy = false
  },
  {
    "https://github.com/nvim-tree/nvim-tree.lua",
    lazy = false,
    config = function()
      require("nvim-tree").setup({
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      })
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      return require('plugins.configs.bufferline')
    end
  },
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
    requires = { " stevearc/dressing.nvim" },
    config = function()
      require("jupynium").setup({})
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      require "startup".setup()
    end
  },
  {
    "https://github.com/zaldih/themery.nvim",
    lazy = false
  },
  {
    "https://github.com/akinsho/toggleterm.nvim",
    config = function()
      require('toggleterm').setup()
    end
  },
  {
    'sainnhe/edge',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.edge_enable_italic = true
    end
  },

  {
    "rockyzhang24/arctic.nvim",
    requires = { "rktjmp/lush.nvim" }
  },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    ---@param opts cn.ConfigSchema
    opts = {
      base_url = "https://carbon.now.sh/",
      options = {
        bg = "blue",
        drop_shadow_blur = "68px",
        drop_shadow = false,
        drop_shadow_offset_y = "20px",
        font_family = "Hack",
        font_size = "18px",
        line_height = "133%",
        line_numbers = true,
        theme = "one-dark",
        width = "680",
        window_theme = "sharp",
        padding_horizontal = "0px",
        padding_vertical = "0px",
      },
    }
  },
  {
    "https://github.com/joshdick/onedark.vim",
    name = "onedarkvim"
  },
  {
    "https://github.com/Hashino/doing.nvim",
    config = function()
      require('doing').setup {
        'hashino/doing.nvim',
        config = function()
          require('doing').setup {
            message_timeout = 2000,
            doing_prefix = 'Doing: ',
            ignored_buffers = { 'NvimTree' },
            winbar = { enabled = true },
            store = {
              file_name = '.tasks',
              auto_create_file = false,
            },
          }
        end,
      }
      local api = require('doing.api')

      vim.keymap.set('n', '<leader>dn', api.done, { desc = '[D]o[n]e with current task' })
      vim.keymap.set('n', '<leader>de', api.edit, { desc = '[E]dit what tasks you`re [D]oing' })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}
  },
  {
    'barrett-ruth/live-server.nvim',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true
  },
  {
    "https://github.com/olimorris/onedarkpro.nvim",
  },
}

return M
