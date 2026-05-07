local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

config.debug_key_events = true

-- # キーボードショートカット
config.keys = {
  {
    key = '[',
    mods = 'CTRL',
    action = act.Multiple({
      act.ActivateCopyMode,
      act.CopyMode('ClearSelectionMode'),
      act.CopyMode('ClearPattern'),
    }),
  },
  -- ペイン分割
  { key = '|',          mods = 'CTRL|SHIFT', action = act.SplitHorizontal({ domain = 'CurrentPaneDomain' }) },
  { key = '_',          mods = 'CTRL|SHIFT', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },
  -- SHIFT+- = _ なので _ でも登録（CTRL+SHIFT+- の実際のキーコード）
  { key = '-',          mods = 'CTRL|SHIFT', action = act.SplitVertical({ domain = 'CurrentPaneDomain' }) },
  -- デフォルトの CTRL+- / CTRL+_ (文字縮小) を無効化
  { key = '-',          mods = 'CTRL',       action = act.DisableDefaultAssignment },
  { key = '_',          mods = 'CTRL',       action = act.DisableDefaultAssignment },
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

-- # フォント設定
-- メインフォント。NF 版を使う場合はファミリー名に "Console NF" を指定
config.font = wezterm.font_with_fallback({ 'HackGen Console' })
config.font_size = 14.0

-- 行間が詰まって見えるときの微調整（お好みで）
config.line_height = 1.0
config.cell_width = 1.0

-- # ウィンドウ設定

-- 起動時のウィンドウサイズ（文字数で指定：列数 × 行数）
config.initial_cols = 120
config.initial_rows = 36

-- 背景透過
config.window_background_opacity = 0.85 -- 0.0(完全透明) ～ 1.0(不透明)

return config
