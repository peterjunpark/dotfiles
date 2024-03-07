-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- theme
config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("0xProto")
config.font_size = 16.0
config.window_background_opacity = 0.97
config.text_background_opacity = 0.97
-- tab bar
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
-- window
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 0,
}
config.window_decorations = "RESIZE"
config.initial_cols = 140
config.initial_rows = 42
config.use_resize_increments = true

-- and finally, return the configuration to wezterm
return config
