local autocmd = vim.api.nvim_create_autocmd

vim.api.nvim_create_user_command("ToggleInlayHints", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})

autocmd("FileType", {
	pattern = { "markdown", "typst" },
	callback = function()
		vim.wo.relativenumber = false
		vim.schedule(function()
			require("zen-mode").open()
		end)
	end,
})

-- autocmd("BufLeave", {
-- 	pattern = { "*.md", "*.typ" },
-- 	callback = function()
-- 		vim.schedule(function()
-- 			local ok, zen = pcall(require, "zen-mode")
-- 			if ok then
-- 				zen.close()
-- 			end
-- 		end)
-- 	end,
-- })
