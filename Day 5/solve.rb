arr = input.lines.map(&:to_i)

#change part number to change part
part=2
steps, current = 0, 0
while current < arr.length
  cache = current
  current += arr[current]
  
  if part == 1
    arr[cache] += 1
  elsif part == 2 
    if arr[cache] < 3 
      arr[cache] += 1
    else
      arr[cache] -= 1
    end
  end
    
  steps += 1
end

puts "Steps: #{steps}"
