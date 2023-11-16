local function pry()
  vim.fn.append(vim.fn.line("."), "require('pry'); Kernel.binding.pry")
end

return {
  pry = pry,
}
