local function term()
  vim.cmd.cd(require("lazyvim.util").root.get())
  local layout = require("util").layout_col_splits(vim.fn.winlayout())

  if #layout < 4 then
    vim.cmd("vs +te")
  else
    vim.cmd("sp +te")
  end
end

return {
  term = term,
}
