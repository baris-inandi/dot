bindsym $mod+r mode $mode_resize
mode $mode_resize {
  bindsym I resize grow height $resize_amount_vertical_px px or $resize_amount_vertical ppt
  bindsym J resize shrink width $resize_amount_horizontal_px px or $resize_amount_horizontal ppt
  bindsym K resize shrink height $resize_amount_vertical_px px or $resize_amount_vertical ppt
  bindsym L resize grow width $resize_amount_horizontal_px px or $resize_amount_horizontal ppt

  bindsym W resize grow height $resize_amount_vertical_px px or $resize_amount_vertical ppt
  bindsym A resize shrink width $resize_amount_horizontal_px px or $resize_amount_horizontal ppt
  bindsym S resize shrink height $resize_amount_vertical_px px or $resize_amount_vertical ppt
  bindsym D resize grow width $resize_amount_horizontal_px px or $resize_amount_horizontal ppt

  bindsym Up resize grow height $resize_amount_vertical_px px or $resize_amount_vertical ppt
  bindsym Left resize shrink width $resize_amount_horizontal_px px or $resize_amount_horizontal ppt
  bindsym Down resize shrink height $resize_amount_vertical_px px or $resize_amount_vertical ppt
  bindsym Right resize grow width $resize_amount_horizontal_px px or $resize_amount_horizontal ppt

  bindsym r floating toggle

  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym q mode "default"
  bindsym $mod+r mode "default"
  bindsym $mod+c move position center, mode "default"
}
