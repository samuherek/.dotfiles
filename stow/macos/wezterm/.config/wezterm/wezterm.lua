local wezterm = require("wezterm")

local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
local theme_colors = theme.colors()

theme_colors.background = "#1b1921"

return {
	font_size = 16.0,
	enable_tab_bar = false,
	-- color_scheme = "rose-pine",
	colors = theme_colors,
	font = wezterm.font("JetBrains Mono", { weight = "Regular" }),
	window_decorations = "RESIZE",
	line_height = 1.1,
	window_padding = {
		left = 34,
		right = 34,
		top = 44,
		bottom = 34,
	},
	window_frame = {
		border_top_height = "0.05cell",
		border_top_color = "black",
	},
}
