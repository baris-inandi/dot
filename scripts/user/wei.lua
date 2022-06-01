local function try(f, catch_f)
  local status, exception = pcall(f)
  if not status then
    catch_f(exception)
  end
end

local function parseArg()
  if #arg > 0 then
    local num = arg[1]
    if num == "cp" then
      os.execute("echo -n 1000000000000000000 | xclip -selection clipboard")
      print("Copied one wei to clipboard.")
      os.exit(0)
    end
    print(num / 10 ^ 18)
  else
    print("Loading From clipboard")
    local file = assert(io.popen('xsel -b -o', 'r'))
    local num = file:read('*all')
    file:close()
    num = tonumber(num)
    if num == nil then
      error("Input is not a number")
    end
    print(num / 10 ^ 18)
  end
end

local function main()
  try(parseArg, function(e)
    print("Error: Cannot parse input")
  end)
end

main()
