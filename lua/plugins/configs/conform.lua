require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier", "markdown-toc", "markdownfmt" },
    toml = { "prettier" },
    yaml = { "prettier" },
    lua = { "stylua" },
    rust = { "rustfmt", "yew-fmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    go = { "gofumpt", "goimports-reviser" },
    sql = { "sqlfmt" },
    python = { "ruff_format", "ruff_organize_imports" },


    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
  },

  format_on_save = {
    timeout_ms = 500,
    async = false,
    lsp_format = "fallback",
  },

  log_level = vim.log.levels.OFF,
  notify_on_error = false,
})
