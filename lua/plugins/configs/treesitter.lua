require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "c", "javascript", "typescript", "go", "vim", "vimdoc", "query" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  }
}
