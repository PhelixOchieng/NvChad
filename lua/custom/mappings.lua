local M = {}
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   visual_mode = "v",
--   insert_mode = "i",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

M.flutter = {
	n = {
		["<F5>"] = { "<cmd> FlutterRun <CR>", "Run flutter application", opts = opts },
	}
}

M.debugger = {
	-- plugin = true,

	n = {
		["<leader>db"] = { "<cmd> lua require('dap').toggle_breakpoint() <CR>", "Togge breakpoint", opts = opts },
		["<leader>dc"] = { "<cmd> lua require('dap').continue() <CR>", "Resume app execution", opts = opts },
		["<leader>do"] = { "<cmd> lua require('dap').step_over() <CR>", "Step over", opts = opts },
		["<leader>di"] = { "<cmd> lua require('dap').step_into() <CR>", "Step into", opts = opts },
	}
}

M.comments = {
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.custom = {
	-- plugin = true,

	i = {
		["<C-s>"] = { "<cmd> w <CR>", "Save file", opts = opts },
	},
	n = {
		["<A-j>"] = { "<Esc>:m .+1<CR>==", "Move block down", opts = opts },
		["<A-k>"] = { "<Esc>:m .-2<CR>==", "Move block up", opts = opts },
    -- ["<leader>ca"] = {
    --   function()
    --     vim.lsp.buf.code_action()
    --   end,
    --   "LSP code action",
    -- },

		-- Buffer Resize
		["<C-Up>"] = { ":resize -2<CR>", "Reduce buffer size", opts = opts },
		["<C-Down>"] = { ":resize +2<CR>", "Increase buffer size", opts = opts },

		-- lspconfig
		["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "LSP definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "LSP hover",
    },

    ["<leader>ca"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
	},
	v = {
		["<A-k>"] = { ":m '< -2<CR>==gv=gv", "Move selected line(s) up", opts = opts },
		["<A-j>"] = { ":m '> +1<CR>==gv=gv", "Move selected line(s) down", opts = opts },
	},
}

return M
