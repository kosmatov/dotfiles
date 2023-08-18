return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      sorting_strategy = "ascending",
      layout_strategy = "cursor",
      layout_config = {
        width = 100,
        height = 20,
        preview_cutoff = 1000,
        prompt_position = "top",
      },
    },
  },
}
