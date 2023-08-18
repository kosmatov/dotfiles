-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*" },
  callback = function()
    vim.cmd("let &titlestring = getcwd()")
  end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd("silent! wall")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "gitrebase", "gitconfig" },
  callback = function()
    vim.cmd("set bufhidden=delete")
  end,
})
