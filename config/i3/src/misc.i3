floating_modifier $mod

gaps inner $gaps_inner
gaps outer $gaps_outer
smart_gaps on

for_window [window_role="pop-up"] floating enable, move position center
for_window [class="Nemo"] floating enable, resize set 1200 1000, move position center
