-- pretty bad solution but whatever

-- whether any click counts
local is_any_click = true

local cur_pos = 50
local dial_size = 100
local counter = 0

local line_iter = io.input(arg[1]):lines()

local function move(x)
  if is_any_click then
    for i = 0, x, x / math.abs(x) do
      if (cur_pos + i) % dial_size == 0 and i ~= 0 then
        counter = counter + 1
      end
    end
  end
  cur_pos = cur_pos + x
  while cur_pos < 0 do
    cur_pos = cur_pos + 100
  end
  cur_pos = cur_pos % dial_size
  if not is_any_click and cur_pos == 0 then counter = counter + 1 end
end

for line in line_iter do
  local num = tonumber(line:sub(-(#line - 1)))

  local dir = line:sub(1, 1)
  if dir == "R" then

  elseif dir == "L" then
    num = -num
  else
    error("invalid direction")
  end

  move(num)
end

print(counter)
