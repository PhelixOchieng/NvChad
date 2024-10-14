local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    vue = { "prettier", "eslint_d" },
    python = { "isort", "ruff_organize_imports", "ruff_fix", "ruff_format" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
