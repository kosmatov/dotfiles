local wezterm = require 'wezterm';
return {
  font = wezterm.font("Monaco"),
  font_size = 13,
  freetype_load_flags = "NO_HINTING",
  color_scheme = "Adventure",
  enable_tab_bar = false,
  window_background_opacity = 1.0,
  window_padding = {
    left = 8,
    right = 8,
    top = 5,
    bottom = 5,
  },
  background = {
    {
      source = {File="__dotfiles__/sleepwatcher-wezterm/images/sunrise-sunflowers-flower-field-nature-scenery-4k-wallpaper-3840x2160.png"},
      repeat_x = "NoRepeat",
      repeat_y = "NoRepeat",
      vertical_align = "Middle",
      horizontal_align = "Center",
      width = "Cover",
      height = "Cover",
    },
  },
  initial_cols = 175,
  initial_rows = 87,
  use_resize_increments = false
}
