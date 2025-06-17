local M = {}

M.opts = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	return {
		completion = {
			completeopt = "menu,menuone,noinsert",
			scrollbar = false,
		},

		confirmation = {
			completeopt = "menu,menuone,noinsert",
			scrollbar = false,
		},

		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},

		mapping = cmp.mapping.preset.insert({
			["<C-n>"] = cmp.mapping.select_next_item(),
			["C-p"] = cmp.mapping.select_prev_item(),
			["<C-j>"] = cmp.mapping.scroll_docs(4),
			["<C-k>"] = cmp.mapping.scroll_docs(-4),
			["<C-c>"] = cmp.mapping.abort(),
			["<C-f>"] = cmp.mapping.complete({ select = true }),
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			-- ["<leader>ca"] = cmp.mapping.code_action(),
		}),

		sources = cmp.config.sources({
			{ name = "lazydev" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
			{ name = "calc" },
			{
				name = "dictionary",
				keyword_length = 2,
			},
		}),

        formatting = {
            format = M.format
        },

		window = {
			completion = cmp.config.window.bordered({
				scrollbar = false,
				border = "none",
				winhighlight = "NormalFloat:MyPmenu,FloatBorder:CompeDocumentationBorder",
                max_width = 40
			}),

            overflow = {
                enable = true
            },

			documentation = cmp.config.window.bordered({
				border = "none",
                style = "minimal",
				winhighlight = "NormalFloat:MyPmenu,FloatBorder:CompeDocumentationBorder",
				max_width = 50,
				min_width = 50,
				max_height = math.floor(vim.o.lines * 0.4),
				min_height = 3,
			}),
		},
	}
end



local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 45
local MAX_KIND_WIDTH = 14

M.get_ws = function (max, len)
  return (" "):rep(max - len)
end

M.format = function(_, item)
  local content = item.abbr
  -- local kind_symbol = symbols[item.kind]
  -- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

  if #content > MAX_LABEL_WIDTH then
    item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
  else
    item.abbr = content .. M.get_ws(MAX_LABEL_WIDTH, #content)
  end

  return item
end

return {
	"https://github.com/hrsh7th/nvim-cmp",
	config = function()
		return require("cmp").setup(M.opts())
	end,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"hrsh7th/cmp-cmdline",
	},
}
