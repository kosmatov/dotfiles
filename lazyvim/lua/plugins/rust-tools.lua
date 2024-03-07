local function on_attach(client, buffer)
end

return {
  "simrat39/rust-tools.nvim",
  opts = {
    tools = {
      runnables = {
        use_telescope = true,
      },
      inlay_hints = {
        auto = true,
        show_parameter_hints = false,
        parameter_hints_prefix = "",
        other_hints_prefix = "",
      },
    },
    server = {
      on_attach = on_attach,
      cmd = { "rust-lsp", "docker-compose", require 'util'.git_root_dir() },
      root_dir = function(_)
        require 'util'.git_root_dir()
      end,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    },
  },
}
