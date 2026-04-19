local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.debug_key_events = true

config.keys = {
  {
    key = '[',
    mods = 'CTRL',
    action = act.ActivateCopyMode,
  },
}

return config
