local ls = require("luasnip")

-- ls.config.setconfig({
--   history = true,
--   updatevents = "TextChanged,TextChangedI",
--   enable_autosnippets = true,
-- })

local fmta = require "luasnip.extras.fmt".fmta
local rep = require "luasnip.extras".rep

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-h>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnips.lua<CR>", {})


ls.add_snippets("go", {
  s("err",
    fmta(
      [[
if err != nil {
  return <results>
}
<finish>
  ]],
      {
        results = i(1),
        finish = i(0)
      }
    )
  )
})

ls.add_snippets("rust", {
  s("pri",
    fmta(
      [[
println!("<pref>{:?}", <var>);
    ]],
      {
        pref = i(1),
        var = i(2),
      }
    )
  ),
}, {
  s("modtest",
    fmta([[
#[cfg(test)]
mod tests {{
  <imports>

  <fin>
}}
  ]],
      {
        imports = c(1, { t "  use super::*;", t " " }),
        fin = i(0)
      }
    ))
}, {
  s("todo",
    fmta(
      [[
<choi>!(<message>);
  ]],
      {
        choi = c(1, { t "todo", t "unimplimented" }),
        message = i(1),
      }
    ))
})


ls.add_snippets("text", {
  s("mit",
    fmta(
      [[
Copyright <year> <copyright>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  ]], {
        year = i(1, "YEAR"),
        copyright = i(2, "HOLDER")
      })
  )
})
