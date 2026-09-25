return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      signs = false,
    },
    servers = {
      solargraph = {
        cmd = { "make", "solargraph" },
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
