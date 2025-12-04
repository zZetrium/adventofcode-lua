local function collect(iter)
  local result = {}
  local i = 1
  for v in iter do
    result[i] = v
    i = i + 1
  end
  return result
end

-- if nil then all are allowed
local allowed_fraction = nil

local function is_sequence(str)
  for i = allowed_fraction or 2, allowed_fraction or #str do
    if #str % i ~= 0 then goto continue end
    if str:sub(1, #str / i):rep(i) == str then return true end
    ::continue::
  end
  return false
end


local counter = 0
local intervals_str = io.input(arg[1]):read("*all")

local numbers = collect(intervals_str:gmatch("%d+"))
for i = 1, #numbers - 1, 2 do
  for num = numbers[i], numbers[i + 1] do
    --print(num)
    if is_sequence(tostring(math.tointeger(num))) then
      counter = counter + tonumber(num)
    end
  end
end
print(counter)
