bindsym $mod+o mode $mode_web
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

  bindsym O mode $mode_web_window

  bindsym Return mode "default"
  bindsym Escape mode "default"
  bindsym $mod+o mode "default"
}