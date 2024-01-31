local wezterm = require("wezterm")
return {
	font = wezterm.font("Monaco"),
	font_size = 13,
	freetype_load_flags = "NO_HINTING",
	color_scheme = "Adventure",
	enable_tab_bar = false,
	window_padding = {
		left = 8,
		right = 8,
		top = 5,
		bottom = 5,
	},
	background = {
		{
			source = {
				File = "__dotfiles__/sleepwatcher-wezterm/images/Moon.jpg",
			},
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
      hsb = {
        hue = 1,
        brightness = 1,
        saturation = 1,
      },
			vertical_align = "Middle",
			horizontal_align = "Center",
			width = "Cover",
			height = "Cover",
			opacity = 1,
		},
		{
			source = {
        Color = "#000d1a",
			},
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
			vertical_align = "Middle",
			horizontal_align = "Center",
			width = "100%",
			height = "100%",
			opacity = 0.85,
		},
	},
	initial_cols = 175,
	initial_rows = 87,
	use_resize_increments = false,
}
