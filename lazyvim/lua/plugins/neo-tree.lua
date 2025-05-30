return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({ dir = vim.env.HOME, reveal = true })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ dir = vim.loop.cwd(), reveal = true, toggle = vim.bo.buftype == "terminal" })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)",      remap = true },
  },
  opts = {
    enable_git_status = false,
    sources = {
      "filesystem",
      "buffers"
    },
    event_handlers = {
      -- {
      --    event = "file_opened",
      --    handler = function(file_path)
      --      require("neo-tree.sources.filesystem").reset_search()
      --      --auto close
      --      require("neo-tree.command").execute({ action = "close" })
      --    end
      -- },
    },
    filtered_items = {
      hide_gitignored = false,
    },
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
