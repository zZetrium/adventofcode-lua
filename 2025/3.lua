-- recursive go brrr
local function next_maxes(num_str, count, start_index)
  if count <= 0 then return "" end

  start_index = start_index or 1

  local max_digit = math.mininteger
  local last_index
  for i = start_index, (#num_str - count + 1) do
    if tonumber(num_str:sub(i, i)) > max_digit then
      max_digit = tonumber(num_str:sub(i, i))
      last_index = i
    end
    
  end
  return max_digit .. next_maxes(num_str, count - 1, last_index + 1)
end

local banks = io.input(arg[1]):read("a"):gmatch("%d+")
local total = 0
local battery_count = 12

for bank in banks do
  total = total + tonumber(next_maxes(bank, battery_count, 1))

end

print(total)
