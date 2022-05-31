exec --no-startup-id xss-lock --transfer-sleep-lock -- "betterlockscreen -l" --nofork
exec_always --no-startup-id feh --bg-fill ~/.config/wallpaper.png
exec --no-startup-id xidlehook --timer 1200 $power_suspend ""
exec_always --no-startup-id $cmd_compositor
exec --no-startup-id xmousepasteblock
exec --no-startup-id dunst
exec --no-startup-id autotiling