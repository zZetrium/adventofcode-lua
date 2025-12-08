package.path = package.path .. ";../lib/?.lua"
local pprint = require "pprint".pprint

local function collect(iter)
    local result = {}
    local i = 1
    for v in iter do
        result[i] = v
        i = i + 1
    end
    return result
end

--- @param str string hello
local function to_array(lines)
    local result = collect(
        function()
            local line = lines()
            return line and collect(line:gmatch("."))
        end)
    return result
end

local can_remove = true
local map = to_array(io.input(arg[1]):lines())
--pprint(map)
local counter = 0
local changed = false
repeat
    changed = false
    for i = 1, #map do
        for j = 1, #map[1] do
            if map[i][j] ~= "@" then
                goto continue
            end
            local surrounding = 0
            for k = i - 1, i + 1 do
                for l = j - 1, j + 1 do
                    if (map[k] and map[k][l]) == "@" then
                        surrounding = surrounding + 1
                    end
                end
            end
            if surrounding < 5 then
                counter = counter + 1;
                if can_remove then
                    if (map[i] and map[i][j]) then
                        map[i][j] = nil
                    end
                    changed = true
                    print(i .. " " .. j)
                end
            end
            ::continue::
        end
    end
until (not changed)
print(counter)
