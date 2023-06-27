local null_ls = require "null-ls"

local formatting = null_ls.builtins.formatting
local linting = null_ls.builtins.code_actions

local sources = {
	formatting.prettierd.with({
		prefer_local = "node_modules/.bin",
	}),
	formatting.csharpier,

	linting.eslint_d
}

null_ls.setup {
	debug = false,
	sources = sources,
}

