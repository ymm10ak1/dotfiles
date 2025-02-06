local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local wsl_domains = wezterm.default_wsl_domains()
for _, dom in ipairs(wsl_domains) do
  -- 今WSLで使用しているディストリビューションに対応
  if
    dom.name == "WSL:Ubuntu-24.04"
    or dom.name == "WSL:Ubuntu-22.04"
    or dom.name == "WSL:Ubuntu-20.04"
    or dom.name == "WSL:Ubuntu"
  then
    dom.default_cwd = "~"
  end
end

-- ｢+｣ボタン押したときのタブのcwdをdefaultDomain(wsl2:Ubuntu22.04)の"~"にする
-- wezterm.on("new-tab-button-click", function(window, pane)
--     window:perform_action(
--         act.SpawnCommandInNewTab({
--             cwd = "~",
--             domain = "CurrentPaneDomain",
--         }),
--         pane
--     )
--     return false
-- end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local title = tab.active_pane.title
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  if tab.is_active then
    background = "#ae8b2d"
  end
  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = " " .. title .. " " },
  }
end)

wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local leader = { key = "f", mods = "CTRL", timeout_milliseconds = 1000 }
local keys = {
  -- 新しいWindow
  {
    key = "n",
    mods = "CTRL|SHIFT",
    action = act.SpawnCommandInNewWindow({
      cwd = "~",
      domain = "CurrentPaneDomain",
    }),
  },
  -- 新しいタブ
  {
    key = "c",
    mods = "LEADER",
    action = act.SpawnCommandInNewTab({
      cwd = "~",
      domain = "CurrentPaneDomain",
    }),
  },
  -- 水平分割
  {
    key = "s",
    mods = "LEADER",
    action = act.SplitHorizontal({
      cwd = "~",
      domain = "CurrentPaneDomain",
    }),
  },
  -- 垂直分割
  {
    key = "v",
    mods = "LEADER",
    action = act.SplitVertical({
      cwd = "~",
      domain = "CurrentPaneDomain",
    }),
  },
  -- pane移動
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  -- paneサイズ変更
  { key = "H", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 5 }) },
  { key = "J", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
  { key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
  { key = "L", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 5 }) },
  -- タブ削除
  { key = "q", mods = "LEADER", action = act.CloseCurrentTab({ confirm = true }) },
  -- ペイン削除
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
  -- タブ移動
  { key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
  -- Copy/Paste
  { key = "C", mods = "CTRL", action = act.CopyTo("Clipboard") },
  { key = "V", mods = "CTRL", action = act.PasteFrom("Clipboard") },
  -- Fullscrenn
  { key = "f", mods = "SHIFT|ALT", action = act.ToggleFullScreen },
}

return {
  wsl_domains = wsl_domains,
  font = wezterm.font_with_fallback({
    { family = "HackGen Console NF" },
    { family = "HackGen Console NF", assume_emoji_presentation = true },
    { family = "SauceCodePro Nerd Font Mono" },
    { family = "JetBrains Mono Nerd Font" },
  }),
  font_size = 14.0,
  adjust_window_size_when_changing_font_size = false,
  color_scheme = "iceberg-dark",
  initial_cols = 120,
  initial_rows = 30,
  audible_bell = "Disabled",
  window_background_opacity = 0.80,
  window_decorations = "RESIZE",
  default_domain = "WSL:Ubuntu-24.04",
  default_prog = { "wsl.exe" },
  hide_tab_bar_if_only_one_tab = true,
  leader = leader,
  keys = keys,
}
