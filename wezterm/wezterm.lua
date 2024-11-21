-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
-- This will hold the configuration.
local config = wezterm.config_builder()

wezterm.on('gui-startup', function(cmd)

  local tab, pane, window = mux.spawn_window(cmd or {})
  -- Create a split occupying the right 1/3 of the screen
  --pane:split { size = 0.66, direction="Left"}
  window:gui_window():maximize()
  -- Create another split in the right of the remaining 2/3
  -- of the space; the resultant split is in the middle
  -- 1/3 of the display and has the focus.
  -- pane:split {}


end)
wezterm.on("toggle-tabbar", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.enable_tab_bar == false then
		wezterm.log_info("tab bar shown")
		overrides.enable_tab_bar = true
	else
		wezterm.log_info("tab bar hidden")
		overrides.enable_tab_bar = false
	end
	window:set_config_overrides(overrides)
end)

-- This is where you actually apply your config choices


-- For example, changing the color scheme:
config.color_scheme = 'tokyonight_night'
-- config.enable_tab_bar = false
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.pane_focus_follows_mouse = true
--config.bidi_enabled = true
--config.bidi_direction = "LeftToRight"
config.enable_kitty_keyboard = true
config.enable_kitty_graphics = true
config.default_cursor_style = 'SteadyBlock'

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
		{
			key = 'f',
			mods = 'CTRL|SHIFT',
			action = wezterm.action.ToggleFullScreen,
		},
		{
			key = '\'',
			mods = 'CTRL',
			action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
		},
    {
      key = 'w',
      mods = 'CMD',
      action = wezterm.action.CloseCurrentTab { confirm = true },
    },
    {
      key = 'h',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.EmitEvent("toggle-tabbar") ,
    },

    {
      key = '|',
      mods = 'LEADER|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
    key = '\\',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
}
native_macos_fullscreen_mode = true
-- and finally, return the configuration to wezterm
return config
