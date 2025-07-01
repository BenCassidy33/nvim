local M = {}

M.opts = function()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	vim.diagnostic.config({
		float = { border = "rounded" },
	})

	return {
		matching = {
			disallow_fuzzy_matching = false,
			disallow_partial_fuzzy_matching = false,
			disallow_partial_matching = false,
			disallow_prefix_unmatching = false,
		},

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
			["<C-h>"] = cmp.mapping(function(fallback)
				if cmp.visible_docs() then
					cmp.close_docs()
				else
					cmp.open_docs()
				end
			end, { "i", "s" }),
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
			format = lspkind.cmp_format(),
		},

		window = {
			completion = cmp.config.window.bordered({
				scrollbar = false,
				border = "rounded",
				-- winhighlight = "NormalFloat:MyPmenu,FloatBorder:None",
				winhighlight = "NormalFloat:MyPmenu,FloatBorder:None",
				-- max_width = math.floor(vim.o.columns * 0.4)
			}),

			overflow = {
				enable = true,
			},

			documentation = cmp.config.disable,
		},
	}
end

local ELLIPSIS_CHAR = "…"
local MAX_LABEL_WIDTH = 45
local MAX_KIND_WIDTH = 14

M.get_ws = function(max, len)
	return (" "):rep(max - len)
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
		"onsails/lspkind.nvim",
	},
}
