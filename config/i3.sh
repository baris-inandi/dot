set $mod Mod4
set $locker_command "bash ~/dot/scripts/user/power.sh suspend"
exec_always "feh --bg-fill ~/dot/config/wallpaper.png"
exec "bash ~/dot/dot.sh"

# color of the bar
set $bar_bg                   "#00000000"
set $bar_seperator            "#505050"

# urgent workspaces
set $ws_urgent_fg             "#ffffff"
set $ws_urgent_bg             "#B42B51"
set $ws_urgent_bg_border      "#00000000"

# workspace buttons
set $ws_fg                    "#ffffff"
set $ws_bg                    "#363636"
set $ws_bg_border             "#606060"

font pango:Iosevka Bold 10

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
# font pango:DejaVu Sans Mono 8

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- "betterlockscreen -l" --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
# set $refresh_i3status killall -SIGUSR1 i3status
set $refresh_i3status killall -SIGUSR1 py3status
bindsym XF86AudioRaiseVolume exec --no-startup-id amixer set Master 5%+ && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id amixer set Master 5%- && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec "alacritty || i3-sensible-terminal"

# kill focused window
bindsym $mod+q kill

# change focus
bindsym $mod+J focus left
bindsym $mod+K focus down
bindsym $mod+I focus up
bindsym $mod+L focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+J move left
bindsym $mod+Shift+K move down
bindsym $mod+Shift+I move up
bindsym $mod+Shift+L move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle; [tiling] border pixel 1; [floating] border pixel 3

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent/child container
bindsym $mod+a focus parent
bindsym $mod+d focus child

set $ws1 " 1 "
set $ws2 " 2 "
set $ws3 " 3 "
set $ws4 " 4 "
set $ws5 " 5 "
set $ws6 " 6 "
set $ws7 " 7 "
set $ws8 " 8 "
set $ws9 " 9 "
set $ws_hidden "Hidden"
set $ws_blank "Blank"
set $ws_music "Spotify"

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1; workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2; workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3; workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4; workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5; workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6; workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7; workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8; workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9; workspace number $ws9

# special workspaces
bindsym $mod+0 workspace $ws_hidden
bindsym $mod+Shift+0 move container to workspace $ws_hidden; workspace $ws_hidden
bindsym $mod+M exec --no-startup-id "bash ~/dot/scripts/user/spotify.sh"
bindsym $mod+Z exec --no-startup-id "bash ~/dot/scripts/user/blank-workspace.sh"

# reload the configuration file
bindsym $mod+Shift+c reload
bindsym $mod+Shift+u exec "xrdb .Xresources"
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-msg exit"

# resize window
mode "resize" {
  bindsym J resize shrink width 5 px or 5 ppt
  bindsym I resize grow height 5 px or 5 ppt
  bindsym K resize shrink height 5 px or 5 ppt
  bindsym L resize grow width 5 px or 5 ppt

  # same bindings, but for the arrow keys
  bindsym Left resize shrink width 5 px or 5 ppt
  bindsym Up resize grow height 5 px or 5 ppt
  bindsym Down resize shrink height 5 px or 5 ppt
  bindsym Right resize grow width 5 px or 5 ppt

  # back to normal: Enter or Escape or $mod+r
  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

set $mode_web "(C) GC (Y) YT (P) MDL (G) GH (N/M) GML (J) WTSP (I) IG (U) TG"
mode $mode_web {
  bindsym C exec --no-startup-id bash ~/dot/scripts/user/web.sh "Google Classroom" "https://classroom.google.com/u/1/h/" -new-tab
  bindsym N exec --no-startup-id bash ~/dot/scripts/user/web.sh "Gmail (User 0)" "https://mail.google.com/mail/u/0/" -new-tab
  bindsym M exec --no-startup-id bash ~/dot/scripts/user/web.sh "Gmail (User 1)" "https://mail.google.com/mail/u/1/" -new-tab
  bindsym P exec --no-startup-id bash ~/dot/scripts/user/web.sh "Moodle"  "https://moodle.koc.k12.tr/" -new-tab
  bindsym Y exec --no-startup-id bash ~/dot/scripts/user/web.sh "YouTube" "https://youtube.com/" -new-tab
  bindsym G exec --no-startup-id bash ~/dot/scripts/user/web.sh "GitHub" "https://github.com/baris-inandi/" -new-tab
  bindsym I exec --no-startup-id bash ~/dot/scripts/user/web.sh "Instagram" "https://instagram.com/direct/inbox/" -new-tab
  bindsym J exec --no-startup-id bash ~/dot/scripts/user/web.sh "Whatsapp Web" "https://web.whatsapp.com/" -new-tab
  bindsym U exec --no-startup-id bash ~/dot/scripts/user/web.sh "Telegram Web" "https://web.telegram.org/" -new-tab

  bindsym Shift+C exec --no-startup-id bash ~/dot/scripts/user/web.sh "Google Classroom" "https://classroom.google.com/u/1/h/" -new-window
  bindsym Shift+N exec --no-startup-id bash ~/dot/scripts/user/web.sh "Gmail (User 0)" "https://mail.google.com/mail/u/0/" -new-window
  bindsym Shift+M exec --no-startup-id bash ~/dot/scripts/user/web.sh "Gmail (User 1)" "https://mail.google.com/mail/u/1/" -new-window
  bindsym Shift+P exec --no-startup-id bash ~/dot/scripts/user/web.sh "Moodle"  "https://moodle.koc.k12.tr/" -new-window
  bindsym Shift+Y exec --no-startup-id bash ~/dot/scripts/user/web.sh "YouTube" "https://youtube.com/" -new-window
  bindsym Shift+G exec --no-startup-id bash ~/dot/scripts/user/web.sh "GitHub" "https://github.com/baris-inandi/" -new-window
  bindsym Shift+I exec --no-startup-id bash ~/dot/scripts/user/web.sh "Instagram" "https://instagram.com/direct/inbox/" -new-window
  bindsym Shift+J exec --no-startup-id bash ~/dot/scripts/user/web.sh "Whatsapp Web" "https://web.whatsapp.com/" -new-window
  bindsym Shift+U exec --no-startup-id bash ~/dot/scripts/user/web.sh "Telegram Web" "https://web.telegram.org/" -new-window

  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym $mod+o mode "default"
}
bindsym $mod+o mode $mode_web

bindsym $mod+asterisk workspace prev
bindsym $mod+minus workspace next

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
  tray_output none
  separator_symbol "  "
	position bottom
  status_command py3status -c ~/dot/config/i3status.conf
  colors {
    background 		      $bar_bg
    separator		          $bar_seperator
    focused_workspace       $ws_bg_border $ws_bg $ws_fg
    inactive_workspace      $bar_bg $bar_bg #eeeeee
    urgent_workspace        $ws_urgent_bg_border $ws_urgent_bg $ws_urgent_fg
  }
}

# notifications
exec "dunst"

# i3 gaps rounded
# for_window [class=".*"] border pixel 0
gaps inner 14
gaps outer 0
# border_radius 8
# smart_borders on
smart_gaps on

bindsym $mod+Shift+s exec --no-startup-id maim --select --hidecursor | xclip -selection clipboard -t image/png | notify-send 'Screenshot (Clipboard)' -t 800
bindsym $mod+Ctrl+Shift+s exec --no-startup-id maim --select --hidecursor "/home/$USER/Pictures/Screenshots/$(date).png" | notify-send 'Screenshot (Save)' -t 800

# lock screen
exec_always --no-startup-id xidlehook --timer 1200 $locker_command ""

bindsym $mod+control+l exec $locker_command

# rofi
bindsym $mod+shift+m exec --no-startup-id "rofi-spotify -st"
bindsym $mod+period exec --no-startup-id "rofimoji -s neutral -r emoji --max-recent 4"
bindsym $mod+u exec --no-startup-id "rofi -show filebrowser"
bindsym $mod+p  exec --no-startup-id "rofi -show run"; mode "default"
bindsym $mod+c exec --no-startup-id "rofi-code"

# alt tab
bindsym $mod+Tab workspace back_and_forth
bindsym $mod+Shift+Tab workspace next

# brightness
bindsym XF86MonBrightnessUp exec brightnessctl s 10%+
bindsym XF86MonBrightnessDown exec brightnessctl s 10%-

# apps
bindsym $mod+shift+f exec "nautilus -w || dolphin"
bindsym $mod+shift+a exec "google-chrome-unstable || firefox"
bindsym $mod+shift+n exec "google-chrome-unstable -incognito"

# kill all windows
bindsym $mod+shift+q [class=".*"] kill; workspace $ws1
bindsym $mod+shift+w focus parent,kill

# media
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# picom
exec_always --no-startup-id picom --experimental-backends --config ~/dot/config/picom.conf -b

# window border

for_window [class=".*"] border pixel 1
for_window [class="Dunst"] border pixel 0

client.focused          #ffffff #ffffff #000000 #556073   #808184
client.focused_inactive #333333 #aaaaaa #000000 #222731   #303031
client.unfocused        #333333 #222222 #888888 #222731   #303031
client.urgent           #2F343A $red    #FFFFFF $red      $red

set $mode_system (Return) suspend, (r) reboot, (q) poweroff, (e) exit
mode "$mode_system" {
    bindsym Return exec --no-startup-id $locker_command, mode "default"
    bindsym r exec --no-startup-id "bash ~/dot/scripts/user/power.sh reboot", mode "default"
    bindsym q exec --no-startup-id "bash ~/dot/scripts/user/power.sh off", mode "default"
    bindsym e exec "i3-msg exit", mode "default"

    # back to normal: Enter or Escape
    bindsym Escape mode "default"
    bindsym space mode "default"
}
bindsym $mod+Escape mode "$mode_system"

# crypto summary
bindsym $mod+g exec --no-startup-id "python ~/dot/scripts/user/crypto.py"

# disable middle click paste
exec --no-startup-id xmousepasteblock

# for browser popups
for_window [window_role="pop-up"] floating enable, move position center
