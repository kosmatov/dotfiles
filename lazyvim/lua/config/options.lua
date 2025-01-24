-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt, env, g = vim.opt, vim.env, vim.g

opt.number = false
opt.relativenumber = false
opt.mouse = {}
opt.title = true
opt.titlestring = "%F"
opt.formatoptions = "qrn1"
opt.cursorline = false

env.GIT_EDITOR = "nvr -cc split --remote-wait"

g.ea = true
g.root_spec = { "cwd", ".git", "lsp" }
-- g.loaded_clipboard_provider = 1
