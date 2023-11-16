return {
  "neovim/nvim-lspconfig",
  dependencies = {},
  opts = {
    servers = {
      rust_analyzer = {
        cmd = { "~/dotfiles/bin/rust-lsp", "docker" },
      },
      ruby_ls = {
        cmd = { ".ruby-lsp/run", "docker" },
      },
    },
  },
}
