local function term()
  vim.cmd.cd(require("lazyvim.util").get_root())
  vim.cmd("vs +te")
end

return {
  term = term,
}
