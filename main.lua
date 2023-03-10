--[[
luaup
]]

local file = io.open("main.luaup", "r")
local m = file:read("*a")
local opt = {}

table.insert(opt, [[math.randomseed(os.time())]]) --Gives a random time

table.insert(opt, [[function wait(n)
  os.execute("sleep " .. tonumber(n))
end
]]) --Wait funtion

table.insert(opt, [[function readfile(n)
  local file = io.open(n, "r")
  local filereading = file:read("*a")
  return filereading
end
]]) --Readfile

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
    ["clearconsole"] = "os.execute('clear')",
    ["tinsert"]="table.insert",
    ["tconcat"]="table.concat",
    ["date"]="os.date()"
}

local v = m:gsub("%w+", words)
table.insert(opt, v)

loadstring(table.concat(opt))()
