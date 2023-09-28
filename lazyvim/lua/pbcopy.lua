local function pbcopy()
  vim.fn.system("ssh host-machine pbcopy", vim.fn.getreg("0"))
end

return {
  send = pbcopy,
}
