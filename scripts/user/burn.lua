if #arg == 2 then
  os.execute(string.format("sudo dd status=\"progress\" bs=1M if=%s of=%s", arg[1], arg[2]))
else
  print("Usage: burn <image> <disk>")
end
