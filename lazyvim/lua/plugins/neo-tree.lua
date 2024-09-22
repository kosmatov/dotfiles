return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    enable_git_status = false,
    filesystem = {
      window = {
        mappings = {
          ["/"] = "noop",
          ["z"] = "noop",
        },
      },
    },
  },
}
