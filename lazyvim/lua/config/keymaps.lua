-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
-- map("n", "<leader>p", '"0p', { desc = "Paste last yank" })
map({ "n", "t" }, "<leader>t", ":vs | te<cr>", { desc = "Open terminal in a new vsplit" })

-- Move to window using the <ctrl> hjkl keys
map("i", "<C-h>", "<esc><C-w>h", { desc = "Go to left window", remap = true })
map("i", "<C-j>", "<esc><C-w>j", { desc = "Go to lower window", remap = true })
map("i", "<C-k>", "<esc><C-w>k", { desc = "Go to upper window", remap = true })
map("i", "<C-l>", "<esc><C-w>l", { desc = "Go to right window", remap = true })
map("t", "<C-h>", "<esc><esc><C-w>h", { desc = "Go to left window", remap = true })
map("t", "<C-j>", "<esc><esc><C-w>j", { desc = "Go to lower window", remap = true })
map("t", "<C-k>", "<esc><esc><C-w>k", { desc = "Go to upper window", remap = true })
map("t", "<C-l>", "<esc><esc><C-w>l", { desc = "Go to right window", remap = true })

--- Git
map("n", "<leader>gg", ":Git<cr>", { desc = "fugitive", remap = true })
map("n", "<leader>gG", ":Git<cr>", { desc = "fugitive", remap = true })
map("n", "<leader>gb", ":Git blame<cr>", { desc = "blame", remap = true })
map("n", "<leader>gv", ":lua require'git'.git_vsplit()<cr>", { desc = "vsplit", remap = true })
