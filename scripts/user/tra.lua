if #arg < 3 then
  print("Usage: tra <from> <to> <argv>")
  os.exit(0)
end

BaseCmd = "trans -indent 2"
local from = arg[1]
local to = arg[2]
arg[0], arg[1], arg[2] = "", "", ""
local args = table.concat(arg, " ")
local cmd = string.format("%s -s %s -t %s %s", BaseCmd, from, to, args)
os.execute(cmd)
