exec_always --no-startup-id feh --bg-fill ~/.config/wallpaper.png
exec --no-startup-id xidlehook --timer 1200 $power_suspend ""
exec --no-startup-id xss-lock --transfer-sleep-lock -- "betterlockscreen -l" --nofork
exec --no-startup-id xmousepasteblock
exec --no-startup-id /usr/lib/xfce-polkit/xfce-polkit
exec --no-startup-id bash ~/dot/scripts/sync/sync.sh
exec --no-startup-id bash ~/dot/startup.sh
