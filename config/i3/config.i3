set $mod Mod4
font pango:Iosevka Medium 10

set $power_suspend "bash ~/dot/scripts/user/power.sh suspend"
set $power_reboot "bash ~/dot/scripts/user/power.sh reboot"
set $power_shutdown "bash ~/dot/scripts/user/power.sh off"

set $preferred_terminal alacritty

set $cmd_terminal "alacritty || i3-sensible-terminal"
set $cmd_file_manager "nautilus -w || dolphin"
set $cmd_browser "google-chrome-unstable || firefox"
set $cmd_private_browser "google-chrome-unstable -incognito || firefox --private-window"
set $cmd_compositor "picom --experimental-backends --config ~/dot/config/picom.conf -b"

set $color_bar_bg #151515
set $color_bar_separator #505050
set $color_ws_urgent_fg #ffffff
set $color_ws_urgent_bg #B42B51
set $color_ws_urgent_border #00000000
set $color_ws_fg #ffffff
set $color_ws_bg #505052
set $color_ws_border #777777
set $color_ws_inactive_fg #eeeeee

set $resize_amount_horizontal 6
set $resize_amount_vertical 4
set $gaps_inner 12
set $gaps_outer 0

set $refresh_status killall -SIGUSR1 py3status

set $mode_resize "Resize"
set $mode_web "(C) GC (Y) YT (P) MDL (G) GH (N/M) GML (J) WTSP (I) IG (U) TG"
set $mode_system "(⤷) Suspend, (r) Reboot, (q) Shutdown, (e) Exit"

set $ws_hidden "Hidden"
set $ws_music "Spotify"

set $ws1 " 1 "
set $ws2 " 2 "
set $ws3 " 3 "
set $ws4 " 4 "
set $ws5 " 5 "
set $ws6 " 6 "
set $ws7 " 7 "
set $ws8 " 8 "
set $ws9 " 9 "

include ~/dot/config/i3/src/*
