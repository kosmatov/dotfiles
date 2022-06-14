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
  window_background_image = "sleepwatcher-wezterm/images/sunset-clouds-nature-scenery-thunderstorm-lightning.png",
  initial_cols = 175,
  initial_rows = 87,
  use_resize_increments = false
}
