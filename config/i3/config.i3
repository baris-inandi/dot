set $mod Mod4
font pango:Iosevka SS07 Medium 10

include ~/.config/i3/colors

set $power_suspend "bash ~/dot/scripts/user/power.sh suspend"
set $power_reboot "bash ~/dot/scripts/user/power.sh reboot"
set $power_shutdown "bash ~/dot/scripts/user/power.sh off"

set $preferred_terminal alacritty

set $cmd_terminal "alacritty || i3-sensible-terminal"
set $cmd_file_manager "nemo | nautilus -w"
set $cmd_browser "google-chrome-unstable || firefox"
set $cmd_private_browser "google-chrome-unstable -incognito || firefox --private-window"
set $cmd_compositor "picom --experimental-backends --config ~/dot/config/picom.conf -b"

set $resize_amount_horizontal 6
set $resize_amount_vertical 4
set $resize_amount_horizontal_px 80
set $resize_amount_vertical_px 70

set $move_amount_vertical 45
set $move_amount_horizontal 60
set $gaps_inner 16
set $gaps_outer 0

set $refresh_status killall -SIGUSR1 py3status

set $mode_resize "Resize"
set $mode_web "(C) GC (Y) YT (P) MDL (G) GH (N/M) GML (J) WTSP (I) IG (U) TG"
set $mode_web_window "[WINDOWED] (C) GC (Y) YT (P) MDL (G) GH (N/M) GML (J) WTSP (I) IG (U) TG"
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
