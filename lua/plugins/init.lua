return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  { "kevinhwang91/promise-async" },
  {
    "kevinhwang91/nvim-ufo",
    requires = "kevinhwang91/promise-async",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- web
        "html",
        "css",
        "scss",
        "javascript",
        "typescript",
        "vue",
        "json",

        -- other
        "rust",
        "python",

        -- defaults
        "vim",
        "lua",
        "vimdoc",
      },
    },
  },
	{
		'rcarriga/nvim-dap-ui',
		dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' }
	},
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss-language-server",
        "typescript-language-server",
        "rust-analyzer",
        "vue-language-server",

        -- formatters
        "prettier",
        "eslint",
        "pyright",

        -- defaults
        "css-lsp",
        "html-lsp",
        "lua-language-server",
        "stylua",
      },
    },
  },
}
