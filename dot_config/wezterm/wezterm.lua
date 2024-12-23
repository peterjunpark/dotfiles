-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_domain = "WSL:Ubuntu"

--- APPEARANCE

-- background
config.color_scheme = "rose-pine"
-- font
config.font = wezterm.font("0xProto")
config.font_size = 14
-- tab bar
config.use_fancy_tab_bar = false
config.tab_max_width = 42
config.tab_bar_at_bottom = true
-- window
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
config.initial_cols = 112
config.initial_rows = 28
config.use_resize_increments = true

config.disable_default_key_bindings = true

--- KEYBINDINGS
local act = wezterm.action

config.keys = {
	-- command palette
	{ key = "p", mods = "CTRL|SHIFT", action = act.ActivateCommandPalette },
	-- new tab
	{ key = "Insert", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	-- close tab
	{ key = "Delete", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
	-- prev tab
	{ key = "PageUp", action = act.ActivateTabRelative(1) },
	{ key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
	-- next tab
	{ key = "PageDown", action = act.ActivateTabRelative(-1) },
	{ key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
}

-- select tab
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL",
		action = act.ActivateTab(i - 1),
	})
end

return config
