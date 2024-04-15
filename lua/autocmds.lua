vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "*.*",
  callback = function (args)
    vim.cmd("loadview")
  end
})

vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*.*",
  callback = function ()
    vim.cmd("mkview")
  end
})
