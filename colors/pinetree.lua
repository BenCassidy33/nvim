local M = {}

local pallete = {
	[{ "Pmenu" }] = { color = "#faf4ed" },
	[{ "Normal", "NormalNC" }] = { color = "#181818" },
	[{ "CursorLine", "CursorColumn" }] = { color = "#95b1ac" },
}

local function set_highlights()
	for groups, color in pairs(pallete) do
		print(groups, color)
	end
end

set_highlights()

return M
