local function git_vsplit()
  local branches = { "develop", "master", "main" }
  for i = 1, 3 do
    local branch_exists = vim.fn.system("git rev-parse --verify", branches[i])

    if branch_exists then
      vim.cmd(string.format(":Gvsplit %s:%%", branches[i]))
      break
    end
  end
end

return {
  git_vsplit = git_vsplit,
}
