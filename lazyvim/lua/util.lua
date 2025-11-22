local function git_root_dir()
  return vim.fn.finddir(".git/..", vim.fn.expand("%:p") .. ";")
end

local function dc_root_dir()
  return vim.fn.finddir("docker/..", vim.fn.expand("%:p") .. ";")
end

local function restore_layout()
  if vim.o.columns < 300 then
    return
  end

  local median = math.floor(vim.o.columns / 2) + 4
  -- Get all windows in the current tab
  local wins = vim.api.nvim_tabpage_list_wins(0)

  if #wins > 0 then
    local buf = vim.api.nvim_win_get_buf(wins[1])
    if vim.bo[buf].filetype == "neo-tree" then
      return
    end
  end

  if #wins == 2 then
    vim.api.nvim_win_set_width(wins[1], median)
  elseif #wins > 2 then
    local buf = vim.api.nvim_win_get_buf(wins[3])
    if vim.bo[buf].filetype ~= "snacks_notif" then
      vim.api.nvim_win_set_width(wins[1], math.floor(median / 2))
      vim.api.nvim_win_set_width(wins[2], math.floor(median / 2))
    end
  end
end

return {
  git_root_dir = git_root_dir,
  dc_root_dir = dc_root_dir,
  restore_layout = restore_layout,
}
