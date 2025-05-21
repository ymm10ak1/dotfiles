local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local launch_menu = {}
local config = wezterm.config_builder()

local function wsl_check(name)
  -- WSLのディストリビューションの起動時のディレクトリを$HOMEに設定する
  local matched = string.find(name, "^WSL:[%w%.%-]")
  if matched ~= nil then
    return true
  end
  return false
end

local wsl_domains = wezterm.default_wsl_domains()
for _, dom in ipairs(wsl_domains) do
  if wsl_check(dom.name) then
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

wezterm.on("format-tab-title", function(tab, _, _, _, _, _) -- function(tab, tabs, panes, config, hover, max_width)
  local tab_index = tab.tab_index + 1
  local tab_title = tab.active_pane.title

  local dom_name = tab.active_pane.domain_name
  if wsl_check(dom_name) then
    tab_title = string.gsub(dom_name, "WSL:", "")
  end

  local title = " " .. string.format("%d: %s", tab_index, tab_title) .. " "
  local background = "#5c6d74"
  local foreground = "#FFFFFF"

  if tab.is_active then
    background = "#ae8b2d"
  end

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)

wezterm.on("gui-startup", function(cmd)
  local _, _, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
  table.insert(launch_menu, {
    label = "PowerShell 7",
    domain = { DomainName = "local" },
    args = { "pwsh.exe" },
  })
  table.insert(launch_menu, {
    label = "CMD",
    domain = { DomainName = "local" },
    args = { "cmd.exe" },
  })
  table.insert(launch_menu, {
    label = "Git for Windows",
    domain = { DomainName = "local" },
    args = { "C:/Program Files/Git/bin/bash.exe", "-l" },
  })
end

local leader = { key = "f", mods = "ALT", timeout_milliseconds = 1000 }
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
  -- Show Launcher
  { key = "l", mods = "ALT", action = act.ShowLauncher },
}

config.wsl_domains = wsl_domains
config.font = wezterm.font_with_fallback({
  { family = "HackGen Console NF" },
  { family = "HackGen Console NF", assume_emoji_presentation = true },
  { family = "SauceCodePro Nerd Font Mono" },
  { family = "JetBrains Mono Nerd Font" },
})
config.font_size = 14.0
config.adjust_window_size_when_changing_font_size = false
config.color_scheme = "iceberg-dark"
config.initial_cols = 120
config.initial_rows = 30
config.audible_bell = "Disabled"
config.window_background_opacity = 0.80
config.window_decorations = "TITLE | RESIZE"
config.default_domain = "WSL:Ubuntu-24.04"
config.default_prog = { "wsl.exe" }
config.hide_tab_bar_if_only_one_tab = true
config.leader = leader
config.keys = keys
config.launch_menu = launch_menu
config.ssh_backend = "Ssh2"
config.ssh_domains = {
  {
    name = "wsl-ssh",
    remote_address = "localhost:22",
    username = "ya10ma",
    multiplexing = "None",
  },
}

return config
