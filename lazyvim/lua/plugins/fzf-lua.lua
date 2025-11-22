local function fzf_width()
  if vim.o.columns > 300 then
    return 180
  end

  return math.floor(vim.o.columns * 0.8)
end

local function fzf_col()
  if vim.o.columns > 300 then
    return 16
  end

  return math.floor(vim.o.columns / 2)
end

return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = {
    winopts = {
      width = fzf_width(),
      col = fzf_col(),
    },
  },
}
