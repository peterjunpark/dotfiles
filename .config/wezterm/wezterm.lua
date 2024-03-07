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

-- background
config.color_scheme = "Tokyo Night Moon"
config.window_background_opacity = 0.97
config.text_background_opacity = 0.97
-- font
config.font = wezterm.font("Monaspace Neon")
config.font_rules = { {
	intensity = "Normal",
	italic = true,
	font = wezterm.font("Monaspace Radon"),
} }
config.font_size = 16.0
config.harfbuzz_features =
	{ "calt=1", "liga=1", "dlig=1", "ss01=1", "ss02=1", "ss03=1", "ss04=1", "ss05=1", "ss06=1", "ss07=1", "ss08=1" }
-- tab bar
config.use_fancy_tab_bar = false
config.tab_max_width = 42
-- window
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "MacOsNative"
config.initial_cols = 140
config.initial_rows = 42
config.use_resize_increments = true

-- and finally, return the configuration to wezterm
return config
