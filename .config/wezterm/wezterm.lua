-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

--- APPEARANCE

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
-- config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 42
config.tab_bar_at_bottom = true
-- window
config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
config.window_decorations = "RESIZE"
config.integrated_title_button_style = "MacOsNative"
config.initial_cols = 140
config.initial_rows = 42
config.use_resize_increments = true

--- KEYBINDINGS

-- show current key table in status area
wezterm.on("update-right-status", function(window, _)
	local name = window:active_key_table()
	if name then
		name = "key_table: " .. name
	end
	window:set_right_status(name or "")
end)

local act = wezterm.action

config.leader = { key = "Space", mods = "SHIFT", timeout_milliseconds = 1000 }
config.keys = {
	-- command palette
	{ key = "p", mods = "CMD|SHIFT", action = act.ActivateCommandPalette },
	-- pane select
	{ key = "s", mods = "CMD", action = act.PaneSelect({ alphabet = "hjkl;" }) },
	-- toggle focus pane
	{ key = "i", mods = "CMD", action = act.TogglePaneZoomState },
	-- close pane
	{ key = "d", mods = "CMD", action = act.CloseCurrentPane({ confirm = false }) },
	-- new pane / vsplit
	{ key = "o", mods = "CMD", action = act.SplitVertical },
	-- new pane / split
	{ key = "p", mods = "CMD", action = act.SplitHorizontal },
	-- prev tab
	{ key = "Backspace", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	-- scroll by line
	{ key = "j", mods = "CMD", action = act.ScrollByLine(1) },
	{ key = "k", mods = "CMD", action = act.ScrollByLine(-1) },
	-- scroll half page
	{ key = "h", mods = "CMD", action = act.ScrollByPage(-0.5) },
	{ key = "l", mods = "CMD", action = act.ScrollByPage(0.5) },
	-- push resize pane table
	{
		key = "r",
		mods = "LEADER",
		action = act.ActivateKeyTable({ name = "RESIZE_PANE", one_shot = false, timeout_milliseconds = 3000 }),
	},
}

local pop_key_table = { key = "Escape", action = "PopKeyTable" }

config.key_tables = {
	-- new_pane = {
	-- 	{ key = "", action = },
	-- },
	RESIZE_PANE = {
		pop_key_table,
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
	},
}

return config
