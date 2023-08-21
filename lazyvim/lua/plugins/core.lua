return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  { "akinsho/bufferline.nvim", enabled = false },
  { import = "lazyvim.plugins.extras.lang.rust" },
}
