bindsym XF86AudioRaiseVolume exec --no-startup-id amixer set Master 5%+ && $refresh_status
bindsym XF86AudioLowerVolume exec --no-startup-id amixer set Master 5%- && $refresh_status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_status
bindsym XF86MonBrightnessUp exec --no-startup-id brightnessctl s 10%+
bindsym XF86MonBrightnessDown exec --no-startup-id brightnessctl s 10%-
bindsym XF86AudioPlay exec --no-startup-id playerctl play-pause
bindsym XF86AudioNext exec --no-startup-id playerctl next
bindsym XF86AudioPrev exec --no-startup-id playerctl previous
bindsym $mod+Return exec --no-startup-id $cmd_terminal
bindsym $mod+q kill
bindsym $mod+shift+q [class=".*"] kill; workspace $ws1
bindsym $mod+shift+w focus parent,kill
bindsym $mod+shift+f exec --no-startup-id $cmd_file_manager
bindsym $mod+shift+a exec --no-startup-id $cmd_browser
bindsym $mod+shift+n exec --no-startup-id $cmd_private_browser
bindsym $mod+J focus left
bindsym $mod+K focus down
bindsym $mod+I focus up
bindsym $mod+L focus right
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right
bindsym $mod+Shift+J move left
bindsym $mod+Shift+K move down
bindsym $mod+Shift+I move up
bindsym $mod+Shift+L move right
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right
bindsym $mod+h split h
bindsym $mod+v split v
bindsym $mod+f fullscreen toggle
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split
bindsym $mod+Shift+space floating toggle; [tiling] border pixel 1; [floating] border pixel 3
bindsym $mod+space focus mode_toggle
bindsym $mod+a focus parent
bindsym $mod+d focus child
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+Shift+1 move container to workspace number $ws1; workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2; workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3; workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4; workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5; workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6; workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7; workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8; workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9; workspace number $ws9
bindsym $mod+0 workspace $ws_hidden
bindsym $mod+Shift+0 move container to workspace $ws_hidden; workspace $ws_hidden
bindsym $mod+M exec --no-startup-id "bash ~/dot/scripts/user/spotify.sh"
bindsym $mod+Z exec --no-startup-id "bash ~/dot/scripts/user/blank-workspace.sh"
bindsym $mod+Shift+c reload
bindsym $mod+Shift+r restart; xrdb .Xresources
bindsym $mod+g exec --no-startup-id "python ~/dot/scripts/user/crypto.py"
bindsym $mod+Shift+s exec --no-startup-id maim --select --hidecursor | xclip -selection clipboard -t image/png | notify-send "Screenshot" "Save to clipboard" -t 1000
bindsym $mod+Ctrl+Shift+s exec --no-startup-id maim --select --hidecursor "~/Pictures/Screenshots/$(date +%U%u%y%H%M%S).png" | notify-send "Screenshot" "Save to pictures" -t 1000
bindsym $mod+shift+m exec --no-startup-id "rofi-spotify -st"
bindsym $mod+period exec --no-startup-id "rofimoji -s neutral -r emoji --max-recent 4"
bindsym $mod+p  exec --no-startup-id "rofi -show run"
bindsym $mod+c exec --no-startup-id "rofi-code"
bindsym $mod+Tab workspace back_and_forth
bindsym $mod+asterisk workspace prev
bindsym $mod+minus workspace next