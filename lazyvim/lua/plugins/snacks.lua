return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[ DASHBOARD ]],
      },
      layout = "left",
      indent = 2,
      on_open = function() vim.cmd("vs +te") end,
    },
    image = { enabled = false }
  },
}
