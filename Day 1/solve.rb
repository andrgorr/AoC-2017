part1 = 1
part2 = ((@str.length)/2)

def charatt(num)
  return @str.chars.to_a[num].to_i if num <= @str.length
  return @str.chars.to_a[num-@str.length].to_i if num > @str.length
end 

arr = 0
(0..@str.length).each do |n|
  #Change "n + part(x) to change part solution"
  arr += charatt(n) if charatt(n)==charatt(n+part2)
end

puts arr
