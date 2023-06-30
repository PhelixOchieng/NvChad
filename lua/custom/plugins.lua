local plugins = {
  {
    "neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function ()
				require "custom.configs.null-ls"
			end
		},
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
				"dart"
			}
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
				"pyright"
        -- "vue-language-server",
        -- "tailwindcss-language-server",
        -- "typescript-language-server",
				-- "eslint_d",
				-- "prettierd",
      }
    }
  },

	-- Folding
	'kevinhwang91/promise-async',
	{
		'kevinhwang91/nvim-ufo',
		-- event = { 'BufReadPre' },
		-- lazy = false,
		requires = 'kevinhwang91/promise-async',
		config = function ()
			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		end
	},

	-- Flutter
	{
		'akinsho/flutter-tools.nvim',
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim', -- optional for vim.ui.select
		},
		config = function ()
			require('custom.configs.flutter-tools')
		end
	},

	-- Debugger
	'mfussenegger/nvim-dap',
	{
		"rcarriga/nvim-dap-ui",
		requires = {"mfussenegger/nvim-dap"},
		config = function ()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	}
}

return plugins
