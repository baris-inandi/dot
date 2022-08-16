bar {
  tray_output none
  separator_symbol "  "
	position bottom
  status_command py3status
  colors {
    background $color_bar_bg
    separator $color_bar_separator
    statusline $color_bar_inactive_fg
    focused_statusline $color_bar_fg
    focused_workspace $color_ws_border $color_ws_bg $color_ws_fg
    inactive_workspace $color_bar_bg $color_bar_bg $color_ws_inactive_fg
    urgent_workspace $color_ws_urgent_border $color_ws_urgent_bg $color_ws_urgent_fg
  }
}
