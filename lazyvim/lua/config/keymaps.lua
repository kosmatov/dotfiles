-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map({ "n", "v" }, "<leader>p", '"0p', { desc = "Paste last yank" })
map("n", "<leader>y", require("pbcopy").send, { desc = "Send yank text to pbcopy" })
map("n", "<C-t>", require("term").term, { desc = "Open terminal in a new vsplit" })
map("t", "<esc><esc>", "<C-\\><C-N>")

-- Move to window using the <ctrl> hjkl keys
map("i", "<C-h>", "<esc><C-w>h", { desc = "Go to left window", remap = true })
map("i", "<C-j>", "<esc><C-w>j", { desc = "Go to lower window", remap = true })
map("i", "<C-k>", "<esc><C-w>k", { desc = "Go to upper window", remap = true })
map("i", "<C-l>", "<esc><C-w>l", { desc = "Go to right window", remap = true })
map("t", "<C-h>", "<esc><esc><C-w>h", { desc = "Go to left window", remap = true })
map("t", "<C-j>", "<esc><esc><C-w>j", { desc = "Go to lower window", remap = true })
map("t", "<C-k>", "<esc><esc><C-w>k", { desc = "Go to upper window", remap = true })
map("t", "<C-l>", "<esc><esc><C-w>l", { desc = "Go to right window", remap = true })
map("n", "<leader>wm", "<C-w>|", { desc = "Maximize current window", remap = true })

-- Coding
map({ "n", "v" }, "<leader>cgc", "gc", { desc = "Comment (gc)" }) -- :help mini.comment
map("n", "<leader>cb", "<C-b>", { desc = "Breakpoint (<C-b>)" })
map("n", "<leader>ct", "<C-a>", { desc = "Run tests (<C-a>)" })
