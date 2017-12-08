instr = inp.lines
values = {}
instr.each do |i|
  values[i.split[0]] = 0 if not values.keys.include?(i.split[0])
end  

largest = 0

instr.each do |i|
  name = i.split[0]
  func = i.split[1]
  n = i.split[2].to_i
  cond = eval("values[\"#{i.split[4]}\"] #{i.split[5]} #{i.split[6]}")
  
  if cond
    if func == "dec"
      values[name] = values[name] - n
    elsif func == "inc"  
      values[name] = values[name] + n
    end
    
    largest = values[name] if values[name] > largest
  end  
end  

puts "Part 1: "
puts values.max_by{|k,v| v}[1]
puts "Part 2: "
puts largest

