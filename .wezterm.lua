-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#706b4e",
	selection_fg = "#f3d9c4",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

config.font = wezterm.font("MonoLisa")
config.font_size = 15

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 30

config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.4,
}


config.keys = {
  {
    key = 'E',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitHorizontal
  },
  {
    key = 'O',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical
  },
  -- Move to the pane above
    {key="UpArrow", mods="CMD", action=wezterm.action{ActivatePaneDirection="Up"}},
    -- Move to the pane below
    {key="DownArrow", mods="CMD", action=wezterm.action{ActivatePaneDirection="Down"}},
    -- Move to the pane left
    {key="LeftArrow", mods="CMD", action=wezterm.action{ActivatePaneDirection="Left"}},
    -- Move to the pane right
    {key="RightArrow", mods="CMD", action=wezterm.action{ActivatePaneDirection="Right"}},
    -- Move cursor one word to the left
    {
      key = "LeftArrow",
      mods = "ALT",
      action = wezterm.action.SendString("\x1b[1;5D"), -- Equivalent to sending ESC + [1;5D
    },
    -- Move cursor one word to the right
    {
      key = "RightArrow",
      mods = "ALT",
      action = wezterm.action.SendString("\x1b[1;5C"), -- Equivalent to sending ESC + [1;5C
    },

}

-- and finally, return the configuration to wezterm
return config
