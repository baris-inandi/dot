if #arg == 2 then
  os.execute(string.format("sudo dd of=%s if=%s bs=1M status=progress", arg[1], arg[2]))
else
  print("Usage: burn <device> <file>")
end
