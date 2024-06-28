require "nvchad.options"

-- add yours here!
local options = {
  wrap = false,
  cursorlineopt = "both",    -- to enable cursorline!

  colorcolumn = "100",
  relativenumber = true,
  scrolloff = 8,
  sidescrolloff = 8,
  expandtab = false,          -- do not convert tabs to spaces
  tabstop = 2,                -- makes tabs 2 spaces

  -- Folding
  foldcolumn = "0",
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end
