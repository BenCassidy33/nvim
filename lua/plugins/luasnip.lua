local M = {}

---@type LazyPluginSpec
M.plugin = {
	"https://github.com/L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		require("luasnip").setup()
		M.SetKeymaps()
		M.snippets()
	end,
}

M.SetKeymaps = function()
	local ls = require("luasnip")

	local keymap = vim.keymap.set
	keymap({ "i", "s" }, "<C-L>", function()
		if ls.expand_or_jumpable() then
			ls.expand_or_jump()
		end
	end, { silent = true })

	keymap({ "i", "s" }, "<C-h>", function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end, { silent = true })

	keymap({ "i", "s" }, "<C-E>", function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end, { silent = true })

	-- keymap("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnips.lua<CR>", {})
end

M.snippets = function()
	local ls = require("luasnip")
	local fmta = require("luasnip.extras.fmt").fmta
	local rep = require("luasnip.extras").rep

	local s = ls.snippet
	local c = ls.choice_node
	local d = ls.dynamic_node
	local i = ls.insert_node
	local t = ls.text_node

	ls.add_snippets("lua", {
		s(
			"plug",
			fmta(
				[[
local M = {}

M.plugin = {
	"<name>",
	config = function()
		return require("<mod_name>").setup(M.opts)
	end
}

M.opts = {
	<opts>
}

return M.plugin
			]],
				{
					name = i(1),
					mod_name = i(2),
					opts = i(3),
				}
			)
		),
	})

	ls.add_snippets("python", {
		s(
			"solu",
			fmta(
				[[
class Solution: 
    def <name>(self, <arguments>) ->> <returnType>
        <fin>

sol = Solution()
print(sol.<name>())
			]],
				{
					name = i(1),
					arguments = i(2),
					returnType = i(3),
					fin = i(4),
				}
			)
		),
	})

	ls.add_snippets("python", {
		s(
			"ifm",
			fmta(
				[[ 
if __name__ == "__main__":
    <fin>
        ]],
				{
					fin = i(1),
				}
			)
		),
	})

	ls.add_snippets("python", {
		s(
			"main",
			fmta(
				[[ 
def main():
    <fin>

if __name__ == "__main__":
    main()
          ]],
				{ fin = i(1) }
			)
		),
	})

	ls.add_snippets("python", {
		s(
			"test",
			fmta(
				[[ 
def test_<name>_<count>():
    input = <input>
    expected = <expected>
    result = <fn>(<args>)
    assert result == expected
          ]],
				{ name = i(1), count = i(2), input = i(3), expected = i(4), fn = i(5), args = i(6) }
			)
		),
	})
end

return M.plugin
