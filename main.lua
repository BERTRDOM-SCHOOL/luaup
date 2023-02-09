local file = io.open("main.luaup", "r")
local m = file:read("*a")
local opt = {}

table.insert(opt, [[math.randomseed(os.time())]]) --Gives a random time

table.insert(opt, [[function wait(n)
  os.execute("sleep " .. tonumber(n))
end]]) --Wait funtion

local words = {
    ["set"] = [[local]],
    ["disp"] = [[print]],
    ["sort"] = [[..]],
    ["rad"] = [[math.rad]],
    ["sin"] = [[math.sin]],
    ["random"] = [[math.random]],
    ["floor"] = [[math.floor]],
    ["ceiling"] = [[math.ceil]],
    ["hide"] = "--",
    ["func"] = "function",
    ["ret"] = "return",
    ["gbl"] = "_G.",
    ["whilelp"] = "while true do",
    ["systime"] = "os.time()",
    ["clearconsole"] = "os.execute('clear')"
}

local v = m:gsub("%w+", words)
table.insert(opt, v)

loadstring(table.concat(opt))()
