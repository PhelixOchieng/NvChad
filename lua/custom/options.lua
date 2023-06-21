local options = {
	wrap = false,								-- disable word wrap
	undofile = true,						-- enable persistent undo
	cursorline = true,					-- highlight current line

  colorcolumn = "100",
  relativenumber = true,
  scrolloff = 8,              -- minimal number of lines to keep above and below the cursor
  sidescrolloff = 8,          -- minimal number of columns to keep on either side of cursor
  expandtab = false,          -- do not convert tabs to spaces
  tabstop = 2,                -- makes tabs 2 spaces

	-- Folding
	foldcolumn = '0',
	foldlevel = 99,
	foldlevelstart = 99,
	foldenable = true,
	-- foldmethod = "expr",
	-- foldexpr = "nvim_treesitter#foldexpr()",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end


