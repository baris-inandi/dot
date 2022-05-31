mode $mode_web_window {
  bindsym C exec --no-startup-id bash ~/dot/scripts/user/web.sh "Google Classroom" "https://classroom.google.com/u/1/h/" -new-window
  bindsym N exec --no-startup-id bash ~/dot/scripts/user/web.sh "Gmail (User 0)" "https://mail.google.com/mail/u/0/" -new-window
  bindsym M exec --no-startup-id bash ~/dot/scripts/user/web.sh "Gmail (User 1)" "https://mail.google.com/mail/u/1/" -new-window
  bindsym P exec --no-startup-id bash ~/dot/scripts/user/web.sh "Moodle"  "https://moodle.koc.k12.tr/" -new-window
  bindsym Y exec --no-startup-id bash ~/dot/scripts/user/web.sh "YouTube" "https://youtube.com/" -new-window
  bindsym G exec --no-startup-id bash ~/dot/scripts/user/web.sh "GitHub" "https://github.com/baris-inandi/" -new-window
  bindsym I exec --no-startup-id bash ~/dot/scripts/user/web.sh "Instagram" "https://instagram.com/direct/inbox/" -new-window
  bindsym J exec --no-startup-id bash ~/dot/scripts/user/web.sh "Whatsapp Web" "https://web.whatsapp.com/" -new-window
  bindsym U exec --no-startup-id bash ~/dot/scripts/user/web.sh "Telegram Web" "https://web.telegram.org/" -new-window
  bindsym D exec --no-startup-id bash ~/dot/scripts/user/web.sh "Discord" "https://discord.com/app/" -new-window

  bindsym O mode $mode_web

  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym $mod+o mode "default"
}