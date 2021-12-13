# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
#
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#

# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4
set $locker_command "betterlockscreen -l && systemctl suspend"

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.

font pango:JetBrains Mono Bold 9

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
# font pango:DejaVu Sans Mono 8

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id amixer set Master 5%+ && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id amixer set Master 5%- && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec kitty

# kill focused window
bindsym $mod+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec --no-startup-id dmenu_run
# A more modern dmenu replacement is rofi:
# bindcode $mod+40 exec "rofi -modi drun,run -show drun"
# There also is i3-dmenu-desktop which only displays applications shipping a
# .desktop file. It is a wrapper around dmenu, so you need that installed.
# bindcode $mod+40 exec --no-startup-id i3-dmenu-desktop

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
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"

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

# reload the configuration file
bindsym $mod+Shift+c reload
bindsym $mod+Shift+u exec "xrdb .Xresources"
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym J resize shrink width 5 px or 5 ppt
        bindsym I resize grow height 5 px or 5 ppt
        bindsym K resize shrink height 5 px or 5 ppt
        bindsym L  resize grow width 5 px or 5 ppt

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

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
	position bottom
        status_command i3status ~/.config/i3status/config
        colors {
		background #151515
		separator #404040
        focused_workspace  #151515 #ffffff #151515
        inactive_workspace #151515 #151515 #ffffff
        urgent_workspace   #ffffff #bf616a
        }
}

# notifications
exec "dunst"

# i3 gaps rounded
# for_window [class=".*"] border pixel 0
gaps inner 7
gaps outer 0
# border_radius 8
# smart_borders on
# smart_gaps on

# audio
exec "start-pulseaudio-x11"

# screenshots
exec "mkdir -p ~/Pictures/Screenshots"
bindsym $mod+Shift+s exec --no-startup-id maim --select --hidecursor | xclip -selection clipboard -t image/png | notify-send 'Screenshot (Clipboard)' -t 800
bindsym $mod+Ctrl+Shift+s exec --no-startup-id maim --select --hidecursor "/home/$USER/Pictures/Screenshots/$(date).png" | notify-send 'Screenshot (Save)' -t 800

# lock screen
exec_always --no-startup-id xidlehook --timer 900 $locker_command ""
# bindsym $mod+shift+l exec "i3lockr --blur 60 --darken 10"
exec "feh --bg-fill ~/dot/wallpaper.png"

bindsym $mod+control+l exec $locker_command

# rofi
# bindcode Mod3 --release exec "rofi -show run"
bindsym $mod+shift+p exec "rofi -show run || krunner"

# alt tab
bindsym $mod+Tab workspace back_and_forth
bindsym $mod+Shift+Tab workspace next

# brightness
exec brightnessctl m 999999
bindsym XF86MonBrightnessUp exec brightnessctl s 10%+
bindsym XF86MonBrightnessDown exec brightnessctl s 10%-

# apps
bindsym $mod+shift+f exec "dolphin || nautilus"
bindsym $mod+shift+a exec "firefox || google-chrome-stable"
bindsym $mod+shift+m exec "spotify"

# kill all windows
bindsym $mod+shift+q [class=".*"] kill; workspace 1
bindsym $mod+shift+w focus parent,kill

# media
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# picom
exec_always --no-startup-id picom --experimental-backends --config ~/dot/picom.conf -b -f

# 144hz
exec "xrandr --output DP-4 --mode 2560x1440 --rate 144.00"

# window border

for_window [class=".*"] border pixel 1
for_window [class="krunner"] border pixel 0

client.focused          #4C7899 #285577 #FFFFFF #556073   #606060
client.focused_inactive #333333 #5F676A #FFFFFF #222731   #282828
client.unfocused        #333333 #222222 #888888 #222731   #282828
client.urgent           #2F343A #BF616A #FFFFFF #BF616A   #BF616A

set $mode_system (q) suspend, (r) reboot, (w) poweroff
mode "$mode_system" {
    bindsym q exec --no-startup-id $locker_command, mode "default"
    bindsym r exec --no-startup-id systemctl reboot, mode "default"
    bindsym w exec --no-startup-id systemctl poweroff, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
    bindsym space mode "default"
}
bindsym $mod+Escape mode "$mode_system"

# startup script
exec "sh ~/dot/startup.sh"
