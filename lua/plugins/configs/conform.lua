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
    markdown = { "prettier", "markdown-toc" },
    toml = { "prettier" },
    yaml = { "prettier" },
    lua = { "stylua" },
    rust = { "rustfmt", "yew-fmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    go = { "gofumpt", "goimports-reviser" },
    python = { "isort", "black" },
    sql = { "sql-formatter" },

    ["*"] = { "codespell" },
    ["_"] = { "trim_whitespace" },
  },

  format_on_save = {
    timeout_ms = 500,
    async = false,
    lsp_format = "fallback",
  },

  log_level = vim.log.levels.ERROR,
  notify_on_error = true,
})
