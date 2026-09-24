-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt, env, g = vim.opt, vim.env, vim.g
local default_branches = { master = true, develop = true, main = true }

local function title()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

opt.number = false
opt.relativenumber = false
-- opt.laststatus = 0
opt.title = true
_G.dotfiles_title = title
opt.titlestring = "%{v:lua.dotfiles_title()}"
opt.formatoptions = "qrn1"
opt.cursorline = false
opt.statuscolumn = ""
opt.signcolumn = "yes"
if env.SSH_TTY then
  g.clipboard = "osc52"
end
opt.clipboard = "unnamedplus"
opt.mouse = {}

env.GIT_EDITOR = "nvr -cc split --remote-wait"

g.ea = true
g.root_spec = { "cwd", ".git", "lsp" }
-- g.loaded_clipboard_provider = 1
