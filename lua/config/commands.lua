vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

vim.api.nvim_create_user_command("ToggleInlayHints", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {})


vim.api.nvim_create_autocmd({ "TermOpen", "BufEnter" }, {
  pattern = { "*" },
  callback = function()
    if vim.opt.buftype:get() == "terminal" then
      vim.cmd(":startinsert")
    end
  end
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "tex" },
  callback = function()
    vim.cmd("VimtexCompile")
  end
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "markdown" },
  callback = function()
    vim.opt.spell = true
    vim.opt.spellang = { "en_us" }

    vim.keymap.set("n", "<leader>sf", "1z=")
    vim.keymap.set("n", "<leader>ca", "z=")
  end
})
