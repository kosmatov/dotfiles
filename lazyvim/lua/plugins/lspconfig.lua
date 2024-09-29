return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      solargraph = {
        cmd = { "ruby-lsp", "docker-compose", require 'util'.git_root_dir() },
      },
      lua_ls = {
        cmd = { "lua-lsp", "docker-compose", require 'util'.git_root_dir() },
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
