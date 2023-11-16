local function rspec()
  local prefix = vim.fn.finddir(".git/..", vim.fn.expand("%:p")..";")
  local path = string.sub(vim.fn.expand("%:p"), string.len(prefix) + 2, -1)
  vim.cmd("vs +te")
  vim.fn.feedkeys("rspec "..path)
end

return {
  rspec = rspec,
}
