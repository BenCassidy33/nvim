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
        transparent = false,

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
  -- {
  --   "epwalsh/obsidian.nvim",
  --   version = "*", -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = "markdown",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = "personal",
  --         path = "~/Notes/",
  --       },
  --     },
  --
  --     completion = {
  --       nvim_cmp = true,
  --       min_chars = 2,
  --     },
  --
  --     note_id_func = function(title)
  --       local suffix = ""
  --       if title ~= nil then
  --         -- If title is given, transform it into valid file name.
  --         suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
  --       else
  --         -- If title is nil, just add 4 random uppercase letters to the suffix.
  --         for _ = 1, 4 do
  --           suffix = suffix .. string.char(math.random(65, 90))
  --         end
  --       end
  --       return tostring(os.time()) .. "-" .. suffix
  --     end,
  --
  --     mappings = {
  --       ["gf"] = {
  --         action = function()
  --           return require("obsidian").util.gf_passthrough()
  --         end
  --       }
  --     }
  --
  --   }
  -- },
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
      transparent = false,
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
    "https://github.com/3rd/image.nvim",
    config = function()
      -- default config
      require("image").setup({
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
          },
          neorg = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "norg" },
          },
          html = {
            enabled = false,
          },
          css = {
            enabled = false,
          },
        },
        max_width = nil,
        max_height = nil,
        max_width_window_percentage = nil,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = false,                                               -- toggles images when windows are overlapped
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        editor_only_render_when_focused = false,                                            -- auto show/hide images when the editor gains/looses focus
        tmux_show_only_in_active_window = true,                                             -- auto show/hide images in the correct Tmux window (needs visual-activity off
        hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
      })
    end
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      "3rd/image.nvim",
    },
    opts = { -- you can just pass {}, defaults below
      renderer_options = {
        mermaid = {
          background = nil, -- nil | "transparent" | "white" | "#hex"
          theme = nil,      -- nil | "default" | "dark" | "forest" | "neutral"
          scale = 1,        -- nil | 1 (default) | 2  | 3 | ...
        },
        plantuml = {
          charset = nil,
        },
        d2 = {
          theme_id = nil,
          dark_theme_id = nil,
          scale = nil,
          layout = nil,
          sketch = nil,
        },
      }
    },

    config = function()
      require("diagram").setup({
        integrations = {
          require("diagram.integrations.markdown"),
          require("diagram.integrations.neorg"),
        },
        renderer_options = {
          mermaid = {
            theme = "forest",
          },
          plantuml = {
            charset = "utf-8",
          },
          d2 = {
            theme_id = 1,
          },
        },
      })
    end
  },
  {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      require "startup".setup()
    end
  }
}

return M
