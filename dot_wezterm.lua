local wezterm = require 'wezterm'
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
  keys = {
    {key="raw:36", mods="SHIFT", action=wezterm.action{SendString="✠"}}
  }
}
