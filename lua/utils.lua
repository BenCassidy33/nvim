local remap = vim.keymap.set
local utils = {}

---@alias Keymaps table<string, ModeKeymaps>

---@class KeymapEntry
---@field [1] string LHS
---@field [2] string|function RHS

---@class ModeKeymaps
---@field opts? table
---@field [integer] KeymapEntry

---@param remaps table<string, ModeKeymaps>
utils.SetKeymaps = function(remaps)
	for mode, mode_table in pairs(remaps) do
		local opts = mode_table.opts or {}
		for _, map in ipairs(mode_table) do
			local lhs = map[1]
			local rhs = map[2]
			remap(mode, lhs, rhs, opts)
		end
	end
end

---@class LazyPluginSpec
---@field [1] string?                 -- plugin name (short or full URL)
---@field name? string               -- custom plugin name
---@field lazy? boolean              -- whether to lazy-load
---@field enabled? boolean|fun():boolean -- conditionally enable
---@field dependencies? (string|LazyPluginSpec)[] -- dependent plugins
---@field version? string|boolean    -- tag or version
---@field priority? number           -- load order priority
---@field config? fun()              -- config function
---@field opts? table                -- plugin options passed to config
---@field build? string|fun()       -- build command
---@field event? string|string[]     -- events that trigger loading
---@field cmd? string|string[]       -- commands that trigger loading
---@field ft? string|string[]        -- filetypes that trigger loading
---@field keys? string|string[]|table -- keybindings that trigger loading
---@field init? fun()                -- function run before plugin loads
---@field main? string               -- module to load as the main plugin logic

utils.AutoCmd = vim.api.nvim_create_autocmd

return utils
