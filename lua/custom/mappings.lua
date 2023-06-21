local M = {}
local opts = { noremap = true, silent = true }

-- Modes
--   normal_mode = "n",
--   visual_mode = "v",
--   insert_mode = "i",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

M.comment = {
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
	i = {
		["<C-s>"] = { "<cmd> w <CR>", "Save file", opts = opts },
	},
	n = {
		["<A-j>"] = { "<Esc>:m .+1<CR>==", "Move block down", opts = opts },
		["<A-k>"] = { "<Esc>:m .-2<CR>==", "Move block up", opts = opts },
		-- ["<leader>e"] = { "<cmd>lua vim.diagnostic.open_float() <CR>", "Show diagnostic in floating window", opts = opts },
	},
	v = {
		["<A-k>"] = { ":m '< -2<CR>==gv=gv", "Move selected line(s) up", opts = opts },
		["<A-j>"] = { ":m '> +1<CR>==gv=gv", "Move selected line(s) down", opts = opts },
	},
}

return M
