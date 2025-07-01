local M = {}

M.plugin = {
    "https://github.com/stevearc/conform.nvim",
    config = function()
        return require("conform").setup(M.opts)
    end,
}

M.opts = {
    formatters_by_ft = {
        asm = { "asmfmt" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettierd" },
        typescriptreact = { "prettierd" },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "prettierd" },
        jsonc = { "prettier" },
        markdown = { "prettierd" },
        toml = { "prettierd" },
        yaml = { "prettierd" },
        rust = { "rustfmt", "yew-fmt" },
        c = { "clang-format", args='--style="{BasedOnStyle: llvm, IndentWidth: 8}"' },
        cpp = { "clang-format", args='--style="{BasedOnStyle: llvm, IndentWidth: 8}"' },
        -- go = { "gofumpt", "goimports-reviser" },
        go = { "goimports" },
        sql = { "sqlfmt" },
        python = { "ruff_format", "ruff_organize_imports" },
        typst = { "prettypst" },
        lua = { "stylua" },

        ["*"] = { "codespell" },
        ["_"] = { "trim_whitespace" },
    },

    format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end

        return { timeout_ms = 500, lsp_format = "fallback" }
    end,

    log_level = vim.log.levels.OFF,
    notify_on_error = false,
}

return M.plugin
