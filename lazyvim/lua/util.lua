local function git_root_dir()
  return vim.fn.finddir(".git/..", vim.fn.expand("%:p") .. ";")
end

local function user_dev_dir()
  return (vim.env.DEV_DIR or vim.env.HOME)
end

local function dc_cmd(...)
  local root_dir = user_dev_dir()
  local cmd = {
    "docker-compose",
    "run",
    "--rm",
    "-v",
    root_dir .. ":" .. root_dir .. ":z",
    "-w",
    root_dir,
    "console",
  }

  local cmd_size = #cmd
  local size = select("#", ...)

  if size > 0 then
    for i = 1, size do
      cmd[cmd_size + i] = select(i, ...)
    end
  end

  return cmd
end

local function dc_root_dir()
  return vim.fn.finddir("docker/..", vim.fn.expand("%:p")..";")
end

return {
  git_root_dir = git_root_dir,
  dc_root_dir = dc_root_dir,
}
