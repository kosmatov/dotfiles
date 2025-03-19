return {
  "catppuccin/nvim",
  name = "catppuccin",
  flavour = "latte",
  opts = {
    transparent_background = true,
    no_italic = true,
    show_end_of_buffer = false,
    custom_highlights = function(colors)
      return {
        TermCursorNC = { fg = colors.none, bg = colors.none }
      }
    end,
  },
}
