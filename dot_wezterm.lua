local wezterm = require 'wezterm'
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = ''

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = ''

wezterm.on('format-window-title', function (tab, pane, tabs, panes, config)
    return tab.active_pane.title
end)

return {
  font = wezterm.font("PlemolJP35 Console NF"),
  font_size = 10.0,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },
  color_scheme = "nord",
  window_background_opacity = 0.8,
  use_fancy_tab_bar = false,
  tab_bar_style = {
    active_tab_left = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#2b2042"}},
      {Text=SOLID_LEFT_ARROW},
    }),
    active_tab_right = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#2b2042"}},
      {Text=SOLID_RIGHT_ARROW},
    }),
    inactive_tab_left = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#1b1032"}},
      {Text=SOLID_LEFT_ARROW},
    }),
    inactive_tab_right = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#1b1032"}},
      {Text=SOLID_RIGHT_ARROW},
    }),
  }
}
local wezterm = require 'wezterm'
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = ''

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = ''

wezterm.on('format-window-title', function (tab, pane, tabs, panes, config)
    return tab.active_pane.title
end)

return {
  font = wezterm.font_with_fallback({
    'PlemolJP35 Console NF'
  }),
  font_size = 10.0,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },
  color_scheme = "nord",
  window_background_opacity = 0.8,
  use_fancy_tab_bar = false,
  tab_bar_style = {
    active_tab_left = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#2b2042"}},
      {Text=SOLID_LEFT_ARROW},
    }),
    active_tab_right = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#2b2042"}},
      {Text=SOLID_RIGHT_ARROW},
    }),
    inactive_tab_left = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#1b1032"}},
      {Text=SOLID_LEFT_ARROW},
    }),
    inactive_tab_right = wezterm.format({
      {Background={Color="#0b0022"}},
      {Foreground={Color="#1b1032"}},
      {Text=SOLID_RIGHT_ARROW},
    }),
  }
}
