-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  cssls = {},
  html = {},
  tailwindcss = {},
  pyright = {},
  tsserver = {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = "/home/anonymous/.nvm/versions/node/v20.16.0/lib/node_modules/@vue/typescript-plugin",
          languages = { "typescript", "javascript", "vue" },
        },
      },
    },
    filetypes = { "typescript", "javascript", "vue" },
  },
  volar = {
    filetypes = { "typescript", "javascript", "vue", "json" },
  },
	eslint = {},
	rust_analyzer = {}
}

-- Folding
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

-- lsps with default config
for name, opts in pairs(servers) do
  opts.on_init = on_init
  opts.on_attach = on_attach
  opts.capabilities = capabilities

  -- local setup = vim.tbl_deep_extend("force", default_setup, lsp_opts)
  lspconfig[name].setup(opts)
end

require('ufo').setup()

-- Show diagnostics in insert mode
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = true,
  }
)
