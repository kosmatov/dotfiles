local vapi, vopt, vfn, vbo = vim.api, vim.o, vim.fn, vim.bo

local function git_root_dir()
  return vfn.finddir(".git/..", vfn.expand("%:p") .. ";")
end

local function dc_root_dir()
  return vfn.finddir("docker/..", vfn.expand("%:p") .. ";")
end

local function col_splits(layout)
  if layout[1] == "leaf" then
    return { layout }
  elseif layout[1][1] == "leaf" or layout[1][1] == "col" then
    return layout
  elseif layout[1] == "row" or layout[1] == "col" then
    return col_splits(layout[2])
  else
    return col_splits(layout[1][2])
  end
end

local function get_win_id(layout)
  if layout[1] == "leaf" then
    return layout[2]
  elseif layout[1][1] == "leaf" then
    return layout[1][2]
  else
    return get_win_id(layout[2])
  end
end

local function multi_display_layout()
  if vopt.columns < 300 then
    return
  end

  local median = math.floor(vopt.columns / 2)
  local layout = vfn.winlayout()

  layout = col_splits(layout)

  if #layout == 1 then
    return
  end

  local bufid = vapi.nvim_win_get_buf(get_win_id(layout[1]))
  local ntr_shift = 0
  if vbo[bufid].filetype == "neo-tree" then
    if #layout < 3 then
      return
    else
      ntr_shift = vapi.nvim_win_get_width(get_win_id(layout[1]))

      if #layout < 5 then
        vapi.nvim_win_set_width(get_win_id(layout[2]), median - ntr_shift + 3)
      else
        vapi.nvim_win_set_width(get_win_id(layout[2]), math.floor(median / 2) - ntr_shift + 6)
      end

      if #layout == 3 then
        vapi.nvim_win_set_width(get_win_id(layout[3]), median - 4)
      else
        vapi.nvim_win_set_width(get_win_id(layout[3]), math.floor(median / 2) - 3)
        vapi.nvim_win_set_width(get_win_id(layout[4]), math.floor(median / 2) - 3)
      end
    end
  else
    if #layout == 2 then
      vapi.nvim_win_set_width(get_win_id(layout[1]), median + 4)
    else
      vapi.nvim_win_set_width(get_win_id(layout[1]), math.floor(median / 2) + 2)
      vapi.nvim_win_set_width(get_win_id(layout[2]), math.floor(median / 2) + 2)

      if #layout > 3 then
        vapi.nvim_win_set_width(get_win_id(layout[3]), math.floor(median / 2))
      end
    end
  end
end

return {
  layout_col_splits = col_splits,
  git_root_dir = git_root_dir,
  dc_root_dir = dc_root_dir,
  restore_layout = multi_display_layout,
}
