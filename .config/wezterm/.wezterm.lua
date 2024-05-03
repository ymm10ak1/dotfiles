local wezterm = require 'wezterm'

local wsl_domains = wezterm.default_wsl_domains()
for _, dom in ipairs(wsl_domains) do
    if dom.name == 'WSL:Ubuntu-22.04' then
        dom.default_cwd = "~"
    end
end

local act = wezterm.action

-- ｢+｣ボタン押したときのタブのcwdをdefaultDomain(wsl2:Ubuntu22.04)の"~"にする
wezterm.on('new-tab-button-click', function(window, pane, button, default_action)
    window:perform_action(
        act.SpawnCommandInNewTab{
            cwd = "~",
            domain = "CurrentPaneDomain",
        },
        pane
    )
    return false
end)

return {
    wsl_domains = wsl_domains,
    font = wezterm.font("HackGen Console NF"),
    font_size = 13.0,
    adjust_window_size_when_changing_font_size = true,
    color_scheme = 'iceberg-dark',
    initial_cols = 120,
    initial_rows  = 30,
    audible_bell = "Disabled",
    window_background_opacity = 0.90,
    default_domain = "WSL:Ubuntu-22.04",
    default_prog = { "wsl.exe" },
    hide_tab_bar_if_only_one_tab = true,
    leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 },
    keys = {
        -- 新しいWindow
        {
            key = "n",
            mods = "CTRL|SHIFT",
            action = act.SpawnCommandInNewWindow {
                cwd = "~",
                domain = "CurrentPaneDomain",
            }
        },
        -- 新しいタブ
        {
            key = "c",
            mods = "LEADER",
            action = act.SpawnCommandInNewTab {
                cwd = "~",
                domain = "CurrentPaneDomain",
            }
        },
        -- 水平分割
        {
            key = "s",
            mods = "LEADER",
            action = act.SplitHorizontal {
                cwd = "~",
                domain = "CurrentPaneDomain",
            }
        },
        -- 垂直分割
        {
            key = "v",
            mods = "LEADER",
            action =  act.SplitVertical {
                cwd = "~",
                domain = "CurrentPaneDomain",
            }
        },
        -- pane移動 
        { key = "h", mods = "LEADER", action = act.ActivatePaneDirection "Left" },
        { key = "j", mods = "LEADER", action = act.ActivatePaneDirection "Down" },
        { key = "k", mods = "LEADER", action = act.ActivatePaneDirection "Up" },
        { key = "l", mods = "LEADER", action = act.ActivatePaneDirection "Right" },
        -- paneサイズ変更
        { key = "H", mods = "LEADER", action = act.AdjustPaneSize {"Left", 5} },
        { key = "J", mods = "LEADER", action = act.AdjustPaneSize {"Down", 5} },
        { key = "K", mods = "LEADER", action = act.AdjustPaneSize {"Up", 5} },
        { key = "L", mods = "LEADER", action = act.AdjustPaneSize {"Right", 5} },
        -- タブ削除
        { key = "q", mods = "LEADER", action = act.CloseCurrentTab { confirm = true } },
        -- ペイン削除
        { key = "x", mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
        -- タブ移動
        { key = '[', mods = "LEADER", action = act.ActivateTabRelative(-1) },
        { key = ']', mods = "LEADER", action = act.ActivateTabRelative(1) },
        -- Copy/Paste
        { key = 'C', mods = "CTRL", action = act.CopyTo "Clipboard" },
        { key = 'V', mods = "CTRL", action = act.PasteFrom "Clipboard" },
        -- Fullscrenn
        { key = 'f', mods = "SHIFT|ALT", action = act.ToggleFullScreen },
    }
}
