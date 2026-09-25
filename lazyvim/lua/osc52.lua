local osc52 = require("vim.ui.clipboard.osc52")

local M = {}

function M.copy(reg)
  return vim.schedule_wrap(osc52.copy(reg))
end

M.paste = osc52.paste

return M
