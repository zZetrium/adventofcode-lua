
local banks = io.lines()
local total = 0
for bank in banks do
  local first_max = math.mininteger
  local max_index = -1
  local i = 1
  for digit in bank:gmatch("%d") do
    if tonumber(digit) > first_max and i ~= #bank then
      first_max = tonumber(digit)
      max_index = i
    end
    i = i + 1
  end

  local second_max = math.mininteger
  for j = max_index + 1,#bank do
    if tonumber(bank:sub(j,j)) > second_max then
      second_max = tonumber(bank:sub(j,j))
    end
  end
  total = total + tonumber(first_max .. second_max)
end

print(total)
