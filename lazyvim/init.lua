-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- if vim.fn.has("pbcopy") == 0 then
--   vim.g.clipboard = {
--     name = "pbcopy (remote)",
--     copy = {
--       ["+"] = "ssh host-machine pbcopy",
--       ["*"] = "ssh host-machine pbcopy",
--     },
--     paste = {
--       ["+"] = function()
--         return vim.fn.systemlist("ssh host-machine pbpaste", { "" }, 1)
--       end,
--       ["*"] = function()
--         return vim.fn.systemlist("ssh host-machine pbpaste", { "" }, 1)
--       end,
--     },
--     cache_enabled = true,
--   }
-- end
