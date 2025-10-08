local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_user_command("ToggleInlayHints", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "txt", "typst", "plaintext" },
	callback = function()
		local cmp = require("cmp")
		cmp.setup.buffer({ enable = false })

		vim.opt.spelllang = "en_us"
		vim.opt.spell = true
		vim.opt.wrap = true
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
-- 	-- pattern = { "lua", "c", "cpp", "javascript", "typescript" },
-- 	-- pattern = { "lua","javascript", "typescript" },
-- 	callback = function()
-- 		vim.opt.shiftwidth = 2
-- 	end,
-- })

vim.api.nvim_create_autocmd("BufLeave", {
	callback = function()
		vim.fn.system("printf '\\e[6 q'")
	end,
})


