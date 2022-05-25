bindsym $mod+Escape mode $mode_system
mode $mode_system {
    bindsym Return exec --no-startup-id $power_suspend, mode "default"
    bindsym r exec --no-startup-id $power_reboot, mode "default"
    bindsym q exec --no-startup-id $power_shutdown, mode "default"
    bindsym e exec --no-startup-id "i3-msg exit", mode "default"
    bindsym Escape mode "default"
    bindsym space mode "default"
}
