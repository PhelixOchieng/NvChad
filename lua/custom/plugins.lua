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
        -- webdev
        "html", "css", "scss", "javascript", "typescript", "vue", "json",
 
        -- low-level
        "rust", "python",
      }
    }
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "vue-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
				"eslint_d",
				"prettierd",
				"pyright",
				"lua-language-server",
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

	-- Image preview
	{'adelarsq/image_preview.nvim',
		event = 'VeryLazy',
		config = function()
			require('image_preview').setup()
		end
	},
}

return plugins
