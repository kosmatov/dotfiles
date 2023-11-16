return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", opts = { setup_jsonls = false } },
  },
  opts = {
   servers = {
      rust_analyzer = {
        cmd = { "~/dotfiles/bin/rust-lsp", "docker" },
      },
      ruby_ls = {
        cmd = { ".ruby-lsp/run", "docker" },
      },
      lua_ls = {
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
