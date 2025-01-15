local function git_root_dir()
  return vim.fn.getcwd() .. "/" .. vim.fn.finddir(".git/..", vim.fn.expand("%:p") .. ";")
end

local function dc_root_dir()
  return vim.fn.getcwd() .. "/" .. vim.fn.finddir("docker/..", vim.fn.expand("%:p") .. ";")
end

return {
  git_root_dir = git_root_dir,
  dc_root_dir = dc_root_dir,
}
