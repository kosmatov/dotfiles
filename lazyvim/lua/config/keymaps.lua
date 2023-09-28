-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<leader>p", '"0p', { desc = "Paste last yank" })
map("n", "<leader>y", require("pbcopy").send, { desc = "Send yank text to pbcopy" })
map("n", "<C-t>", require("term").term, { desc = "Open terminal in a new vsplit" })

-- Move to window using the <ctrl> hjkl keys
map("i", "<C-h>", "<esc><C-w>h", { desc = "Go to left window", remap = true })
map("i", "<C-j>", "<esc><C-w>j", { desc = "Go to lower window", remap = true })
map("i", "<C-k>", "<esc><C-w>k", { desc = "Go to upper window", remap = true })
map("i", "<C-l>", "<esc><C-w>l", { desc = "Go to right window", remap = true })
map("t", "<C-h>", "<esc><esc><C-w>h", { desc = "Go to left window", remap = true })
map("t", "<C-j>", "<esc><esc><C-w>j", { desc = "Go to lower window", remap = true })
map("t", "<C-k>", "<esc><esc><C-w>k", { desc = "Go to upper window", remap = true })
map("t", "<C-l>", "<esc><esc><C-w>l", { desc = "Go to right window", remap = true })
map({ "n", "i" }, "<C-m>", "<esc><C-w>|", { desc = "Maximize current window", remap = true })

-- Git
map("n", "<leader>gg", "<cmd>Git<cr>", { desc = "fugitive", remap = true })
map("n", "<leader>gG", "<cmd>Git<cr>", { desc = "fugitive", remap = true })
map("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "blame", remap = true })
map("n", "<leader>gv", require("git").git_vsplit, { desc = "vsplit", remap = true })
