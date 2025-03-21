-- Autocmds are automatically loaded on the VeryLazy event -- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd("silent! wall")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "gitrebase", "gitconfig" },
  callback = function()
    vim.opt.bufhidden = "delete"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ruby" },
  callback = function()
    vim.keymap.set("n", "<C-b>", require("breakpoint").pry, { desc = "Set breakpoint" })
    vim.keymap.set("n", "<C-a>", require("test").rspec, { desc = "Run rspec" })
  end,
})

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  callback = function()
    vim.cmd.startinsert()
  end,
})
