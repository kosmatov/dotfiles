return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", opts = { setup_jsonls = false } },
  },
  opts = {
   servers = {
      solargraph = {
        cmd = { "ruby-lsp", "docker-compose", require'util'.git_root_dir() },
      },
      lua_ls = {
        cmd = { "lua-lsp", "docker-compose", require'util'.git_root_dir() },
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
