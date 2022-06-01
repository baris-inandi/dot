if arg[1] then
  if string.find(arg[1], "/") then
    Repo = arg[1]
  else
    Repo = "baris-inandi/" .. arg[1]
  end
  local cmd = "git clone https://github.com/" .. Repo
  os.execute(cmd)
else
  print("Usage: gitclone <GitHub Repo>")
end
