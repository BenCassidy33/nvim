local opts = function()
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

		window = {
			completion = cmp.config.window.bordered({
				scrollbar = false,
				border = "none",
				winhighlight = "NormalFloat:MyPmenu,FloatBorder:CompeDocumentationBorder",
			}),
			documentation = cmp.config.window.bordered({
				border = "none",
				winhighlight = "NormalFloat:MyPmenu,FloatBorder:CompeDocumentationBorder",
				max_width = 50,
				min_width = 50,
				max_height = math.floor(vim.o.lines * 0.4),
				min_height = 3,
			}),
		},
	}
end

return {
	"https://github.com/hrsh7th/nvim-cmp",
	config = function()
		return require("cmp").setup(opts())
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
