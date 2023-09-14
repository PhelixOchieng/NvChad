local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)
  local global_ts = '/home/anonymous/.nvm/versions/node/v16.20.0/lib/node_modules/typescript/lib/'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end
local servers = {
  rust_analyzer = {},
  volar = {
    filetypes = { 'vue', 'typescriptreact', 'typescript', 'javascript', 'javascriptreact', 'json'},
		on_new_config = function(new_config, new_root_dir)
			new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
		end,
  },
  tailwindcss = {},
	pyright = {},
  clangd = {},
	csharp_ls = {},
	gopls = {},
	intelephense = {},
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

