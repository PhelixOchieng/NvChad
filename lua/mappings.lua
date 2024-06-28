require "nvchad.mappings"

-- Modes
--   normal_mode = "n",
--   visual_mode = "v",
--   insert_mode = "i",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Comments
map({ "n", "i" }, "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Line Toggle" })
map(
  "v",
  "<C-_>",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Line Toggle" }
)

-- Movement
map("n", "<A-j>", "<Esc>:m .+1<CR>==", { desc = "Move block down" })
map("n", "<A-k>", "<Esc>:m .-2<CR>==", { desc = "Move block up" })
map("v", "<A-j>", ":m '> +1<CR>==gv=gv", { desc = "Move line(s) down" })
map("v", "<A-k>", ":m '> -2<CR>==gv=gv", { desc = "Move line(s) up" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Folding
map("n", "zR", function()
  require("ufo").openAllFolds()
end, { desc = "Open all folds" })
