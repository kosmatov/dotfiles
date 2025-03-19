return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      solargraph = {
        cmd = { "docker", "compose", "run", "--rm", "solargraph" },
      },
      lua_ls = {
        cmd = { "docker", "compose", "run", "--rm", "lua-ls" },
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace"
            }
          }
        }
      },
    },
  },
}
