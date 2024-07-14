local ls = require("ls")

ls.config.setconfig({
	history = true,
	updatevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

local s = ls.snippet
local c = ls.choice_node
local d = ls.dynamic_node
local i = ls.insert_node
local t = ls.text_node
local sn = ls.snippet_node
