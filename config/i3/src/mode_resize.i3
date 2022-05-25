bindsym $mod+r mode $mode_resize
mode $mode_resize {
  bindsym J resize shrink width $resize_amount_horizontal px or $resize_amount_horizontal ppt
  bindsym I resize grow height $resize_amount_vertical px or $resize_amount_vertical ppt
  bindsym K resize shrink height $resize_amount_vertical px or $resize_amount_vertical ppt
  bindsym L resize grow width $resize_amount_horizontal px or $resize_amount_horizontal ppt
  bindsym Left resize shrink width $resize_amount_horizontal px or $resize_amount_horizontal ppt
  bindsym Up resize grow height $resize_amount_vertical px or $resize_amount_vertical ppt
  bindsym Down resize shrink height $resize_amount_vertical px or $resize_amount_vertical ppt
  bindsym Right resize grow width $resize_amount_horizontal px or $resize_amount_horizontal ppt
  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym $mod+r mode "default"
}
