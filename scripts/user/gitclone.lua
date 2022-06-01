local function try(f, catch_f)
    local status, exception = pcall(f)
    if not status then
        catch_f(exception)
    end
end

local function parseArg()
    if #arg > 1 then
        local num = arg[1]
        if num == "cp" then
            os.execute(string.format("echo -n \"%s\" | xclip -selection clipboard", num))
            print("Copied one wei to clipboard.")
            os.exit(0)
            print(math.floor(num) / 10 ^ 18)
        end
    else
        local num = assert(io.popen("xsel -b -o"), "Failed to get clipboard")
        num:lines().concat(0, "")
        print(num / 10 ^ 18)
    end
end

local function main()
    try(parseArg, function(e)
        print(f "Wei: Cannot parse input")
    end)
    print("[1 ETH = 1000000000000000000 wei]")
end

main()
