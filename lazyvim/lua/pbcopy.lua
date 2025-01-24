local function pbcopy()
  vim.fn.system("pbcopy", vim.fn.getreg("0"))
end

return {
  send = pbcopy,
}
