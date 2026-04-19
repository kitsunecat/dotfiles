local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.debug_key_events = true

config.keys = {
  { key = '[',          mods = 'CTRL',       action = act.ActivateCopyMode },
  -- ペイン分割
  { key = 'd',          mods = 'CTRL|SHIFT', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },
  { key = 'e',          mods = 'CTRL|SHIFT', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
  -- ペイン移動
  { key = 'h',          mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Left') },
  { key = 'l',          mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Right') },
  { key = 'k',          mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Up') },
  { key = 'j',          mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Down') },
  { key = 'LeftArrow',  mods = 'CTRL|SHIFT', action = act.AdjustPaneSize({ 'Left', 5 }) },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.AdjustPaneSize({ 'Right', 5 }) },
  { key = 'UpArrow',    mods = 'CTRL|SHIFT', action = act.AdjustPaneSize({ 'Up', 5 }) },
  { key = 'DownArrow',  mods = 'CTRL|SHIFT', action = act.AdjustPaneSize({ 'Down', 5 }) },
}

return config
