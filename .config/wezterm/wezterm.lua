local wezterm = require "wezterm"
local config = wezterm.config_builder()

config.font = wezterm.font "Fantasque Sans Mono"
config.default_cursor_style = "BlinkingUnderline"
config.animation_fps = 24
config.font_size = 18
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 24
config.hide_tab_bar_if_only_one_tab = true

-- config.window_background_opacity = 0.8

config.colors = {
  background = "#1f1f1f",
  foreground = "#ffffff",
  cursor_bg = "#007fff",
  
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    background = '#1f1f1f',
  },
}

function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then
    return title
  end
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    if tab.is_active then
      return {
        { Background = { Color = '#5f5f5f' } },
        { Foreground = { Color = '#ffffff' } },
        { Text = ' ' .. title .. ' ' }
      }
    end
    return {
        { Background = { Color = '#1f1f1f' } },
        { Foreground = { Color = '#ffffff' } },
        { Text = ' ' .. title .. ' ' }
      }
  end
)
return config
