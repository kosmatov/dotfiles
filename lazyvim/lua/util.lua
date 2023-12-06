local function git_root_dir()
  return vim.fn.finddir(".git/..", vim.fn.expand("%:p")..";")
end

return {
  git_root_dir = git_root_dir
}
