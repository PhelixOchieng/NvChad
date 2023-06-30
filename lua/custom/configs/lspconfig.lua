local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
	pyright = {}
}

-- Folding setup
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

for lsp, lsp_opts in pairs(servers) do
  local default_setup = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  local setup = vim.tbl_deep_extend("force", default_setup, lsp_opts)
  lspconfig[lsp].setup(setup)
end

-- Require the folding plugin
require('ufo').setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- delay update diagnostics
    update_in_insert = true,
  }
)

