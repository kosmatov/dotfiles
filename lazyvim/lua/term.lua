local function term()
  vim.cmd.cd(require("lazyvim.util").root.get())
  vim.cmd("vs +te")
end

return {
  term = term,
}
