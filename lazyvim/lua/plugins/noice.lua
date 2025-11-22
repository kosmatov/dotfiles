return {
  "noice.nvim",
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = "10%",
          col = "25%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = "10%",
          col = "25%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
      }
    },
  },
}
